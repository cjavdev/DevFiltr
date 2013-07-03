require 'rspec'

class Grader  
  attr_accessor :example_count, :failure_count, :pending_count
  attr_accessor :specs, :solution, :report, :format, :is_error
  
  ROOT_DIR      = "devfiltr"
  SOLUTION_DIR  = "lib"
  SOLUTION_NAME = "solution"
  SPEC_DIR      = "spec"
  SPEC_NAME     = "solution_spec"
  
  def self.create(type, specs, solution, format = :html)
    setup_tree
    
    case type
    when :ruby
      RubyGrader.new(specs, solution, format)
    when :js
      JsGrader.new(specs, solution, format)
    end
  end
  
  def grade
    raise "Not implemented"
  end
  
  private
  def initialize(specs, solution, format)
    @format = format
    @specs = specs
    @solution = solution
    @example_count = 0
    @failure_count = 0
    @pending_count = 0
  end
  
  def self.setup_tree 
    unless Dir.exists?(ROOT_DIR)
      Dir.mkdir(ROOT_DIR)
    end
    
    [SOLUTION_DIR, SPEC_DIR].each do |dir|
      unless Dir.exists?(ROOT_DIR + "/" + dir)
        Dir.mkdir(ROOT_DIR + "/" + dir)
      end
    end
  end
  
  def save_spec_file(specs)
    path =[ROOT_DIR, SPEC_DIR, SPEC_NAME].join("/")
    File.open(path + @lang_ext, "w") do |f|
      req = "require_relative '../#{SOLUTION_DIR}/#{ SOLUTION_NAME }'"
      unless specs.index(req)
        f.puts req
      end
      f.puts specs
    end
  end
  
  def save_sol_file(solution)
    path = [ROOT_DIR, SOLUTION_DIR, SOLUTION_NAME].join("/")
    File.open(path + @lang_ext, "w") do |f|
      f.puts solution
    end
  end
end

require 'stringio'

class RubyGrader < Grader 
  attr_accessor :lang_ext
  
  def initialize(specs, solution, format)
    @lang_ext = ".rb"

    save_spec_file(specs)
    save_sol_file(solution)
    
    super(specs, solution, format)
  end
  
  def grade
    @is_error = false
    begin
      config = RSpec.configuration
      config.output_stream = StringIO.new #File.open('test.html', 'w')
      config.formatter = GraderHtmlFormatter
      path = [Grader::ROOT_DIR, Grader::SPEC_DIR].join("/")
   
      RSpec::Core::Runner::run(['devfiltr'])
    rescue  => e
      @report = e.message
      @report += e.backtrace.join("\n")
      @example_count = -1
      @failure_count = -1
      @pending_count = -1
      @is_error = true
    end
    unless @is_error
      # puts e.messages
      @example_count = config.formatters.first.example_count
      @failure_count = config.formatters.first.failure_count
      @pending_count = config.formatters.first.pending_count  
      @report = config.output_stream.string
    end
    self                
  end
end

require 'rspec/core/formatters/base_text_formatter'
require 'rspec/core/formatters/html_formatter'
require 'rspec/core/formatters/html_printer'
require 'rspec/core/formatters/snippet_extractor'

class GraderHtmlFormatter < RSpec::Core::Formatters::HtmlFormatter
  @@editor_count = 0
  def initialize(output)
    super(output)
    @printer = GraderHtmlPrinter.new(output)
  end
  
  def extra_failure_content(exception)
    @@editor_count += 1
    backtrace = exception.backtrace.map {|line| backtrace_line(line)}
    backtrace.compact!
    @snippet_extractor ||= GraderSnippetExtractor.new
    
    "<div id='editor_#{@@editor_count}' class='editor'>#{@snippet_extractor.snippet(backtrace)}</div><script>
	  var editor_#{@@editor_count} = ace.edit('editor_#{@@editor_count}'); editor_#{@@editor_count}.setTheme('ace/theme/monokai');editor_#{@@editor_count}.getSession().setMode('ace/mode/ruby');</script>"
  end
end

class GraderHtmlPrinter < RSpec::Core::Formatters::HtmlPrinter
  def initialize(output)
    super(output)
  end
  
  def print_html_start
    # @output.puts REPORT_HEADER
  end
  
  def print_summary( was_dry_run, duration, example_count, failure_count, pending_count )
    # TODO - kill dry_run?
    if was_dry_run
      totals = "This was a dry-run"
    else
      totals =  "#{example_count} example#{'s' unless example_count == 1}, "
      totals << "#{failure_count} failure#{'s' unless failure_count == 1}"
      totals << ", #{pending_count} pending" if pending_count > 0
    end

    formatted_duration = sprintf("%.5f", duration)

    @output.puts "<script type=\"text/javascript\">document.getElementById('totals').innerHTML = \"#{totals}\";</script>"
    @output.puts "</div>"
    @output.puts "</div>"
  end
  REPORT_HEADER = ""
  
  def print_example_passed( description, run_time )
    formatted_run_time = sprintf("%.5f", run_time)
    @output.puts "    <dd class=\"example passed\"><span class=\"passed_spec_name\">#{h(description)}</span></dd>"
  end

  def print_example_failed( pending_fixed, description, run_time, failure_id, exception, extra_content, escape_backtrace = false )
    formatted_run_time = sprintf("%.5f", run_time)

    @output.puts "    <dd class=\"example #{pending_fixed ? 'pending_fixed' : 'failed'}\">"
    @output.puts "      <span class=\"failed_spec_name\">#{h(description)}</span>"
    @output.puts "      <div class=\"failure\" id=\"failure_#{failure_id}\">"
    if exception
      @output.puts "        <div class=\"message\"><pre>#{h(exception[:message])}</pre></div>"
      if escape_backtrace
        @output.puts "        <div class=\"backtrace\"><pre>#{h exception[:backtrace]}</pre></div>"
      else
        @output.puts "        <div class=\"backtrace\"><pre>#{exception[:backtrace]}</pre></div>"
      end
    end
    @output.puts extra_content if extra_content
    @output.puts "      </div>"
    @output.puts "    </dd>"
  end

  def print_example_pending( description, pending_message )
    @output.puts "    <dd class=\"example not_implemented\"><span class=\"not_implemented_spec_name\">#{h(description)} (PENDING: #{h(pending_message)})</span></dd>"
  end
  
end

class GraderSnippetExtractor < RSpec::Core::Formatters::SnippetExtractor
  def post_process(highlighted, offending_line)
    new_lines = []
    highlighted.split("\n").each_with_index do |line, i|
      new_line = "#{line}"
      new_line = "#{new_line}" if i == 2
      new_lines << new_line
    end
    new_lines.join("\n")
  end
  def snippet(backtrace)
    raw_code, line = snippet_for(backtrace[0])
    highlighted = @@converter.convert(raw_code)
  end
end
class RSpec::Core::Formatters::SnippetExtractor::NullConverter
  def convert(code)
    code
  end
end
