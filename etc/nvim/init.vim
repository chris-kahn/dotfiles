lua require 'init'
call timer_start(1000, {-> execute(':let &stl=&stl')}, {'repeat': -1})
