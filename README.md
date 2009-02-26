Thread-local attr_accessor
========

Think attr_accessor, only thread-local. Figures, huh?

    require 'threadsafe-attr-accessor'
    
    class Person
      tl_attr_accessor :name
      tl_attr_writer :spouse
      tl_attr_reader :fullname
    end

Yeah, I know the examples above probably aren't good
candidates for thread-local attribute accessors, but
you get the gist.

Works for classes too:

    class Person
      tl_cattr_accessor :connection
    end

License
=======

(c) 2009 Mathias Meyer

MIT Baby!