require 'test_helper'

class Person
  ts_attr_accessor :connection
  ts_attr_reader :owner
  ts_attr_writer :job
end

class AttrAccessorTest < Test::Unit::TestCase
  context "with a person instance" do
    setup do
      @person = Person.new
    end
    
    context "and a connection" do
      setup do
        @person.connection = :connection
      end
      
      should "keep the connection in a thread local variable" do
        assert_not_nil Thread.current["person_#{@person.object_id}_connection"]
      end
      
      should "be nil in a different thread" do
        person = @person
        t = Thread.new {Thread.current[:result] = person.connection}
        t.join
        assert_nil t[:result]
        assert_not_nil person.connection
      end
      
      should "store different values for different threads" do
        person = @person
        t = Thread.new do
          person.connection = :other_connection
          Thread.current[:result] = person.connection
        end
        t.join
        assert_equal :other_connection, t[:result]
      end
    end
    
    context "and an owner" do
      setup do
        Thread.current["person_#{@person.object_id}_owner"] = :god
      end
      
      should "return the value from thread local" do
        assert_equal :god, @person.owner
      end
      
      should "be nil in a different thread" do
        person = @person
        t = Thread.new do
          Thread.current[:result] = person.owner
        end
        t.join
        assert_nil t[:result]
        assert_equal :god, person.owner
      end
      
      should "not have a setter defined" do
        assert !@person.respond_to?("owner=")
      end
    end
    
    context "and a job" do
      setup do
        @person.job = :janitor
      end
      
      should "store the job in a thread local" do
        assert_equal :janitor, Thread.current["person_#{@person.object_id}_job"]
      end
      
      should "not have a getter" do
        assert !@person.respond_to?(:job)
      end
      
      should "be not overwrite from a different" do
        person = @person
        t = Thread.new do
          person.job = :ceo
        end
        t.join
        assert_equal :janitor, Thread.current["person_#{@person.object_id}_job"]
      end
    end
  end
end