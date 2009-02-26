Thread-safe attr_accessor
========

Think attr_accessor, only thread-safe. Figures, huh?

    require 'threadsafe-attr-accessor'
    
    class Person
      ts_attr_accessor :name
      ts_attr_writer :spouse
      ts_attr_reader :fullname
    end

Yeah, I know the examples above probably aren't good
candidates for thread-safe attribute accessors, but
you get the gist.

Works for classes too:

    class Person
      ts_cattr_accessor :connection
    end

License
=======

(c) 2009 Mathias Meyer

MIT Baby!