require 'bcrypt'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  has_many :assessments, foreign_key: :administrator_id
  has_many :assessment_attempts, foreign_key: :candidate_id
  
  after_create :seed
  
  def seed
    spec_code = <<-CODE
    describe Calculator do
      it 'adds' do
        c = Calculator.new
        c.add(1, 2).should == 3
      end
      
      it 'subtracts' do
        c = Calculator.new
        c.subtract(2,1).should == 1
      end
    end
    CODE
    
    sol_code = <<-CODE
    class Calculator
      def add(x, y)
        x + y
      end
    end
    CODE
    
    skeleton_code = <<-CODE
    class Calculator
      def add(x, y)
        
      end
      
      def subtract(x, y)
        
      end
    end
    CODE
    calculator = Assessment.new(
      :title            => "Calculator", 
      :difficulty       => 1, 
      :administrator_id => self.id, 
      :instructions     => "Build a calculator that adds, subtracts, multiplies, and divides.", 
      :language         => "ruby", 
      :specs            => spec_code, 
      :time_limit       => 10, 
      :skeleton         => skeleton_code )
    calculator.assessment_attempts.new(
      :title     => "Calculator Attempt 1",
      :solution  => sol_code,
      :candidate_id => User.find_by_email("sample_student@devfiltr.io").id )
    calculator.assessment_attempts.first.grade  
    calculator.save!  
  end
end
