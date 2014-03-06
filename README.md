automate-tests-samples
======================
## Overview
This sample write for our tester <font color="red"> **Hana**</font>, <font color='orange'>Coffee, Coffee, You own me!</font>

## Ruby Selenium WebDriver tips
1. 保持cookie

	```ruby
	Selenium::WebDriver.for(:firefox, :profile => 'default') #selenium 2 
	```
	
2. 执行一段JS脚本
	
	```ruby
	require 'rubygems'  
	require 'selenium-webdriver'  
	dr = Selenium::WebDriver.for :ie  
	url = 'http://www.qq.com'  
	dr.navigate.to url  
	sleep 3  
	js = <<JS  
	    p = document.getElementById("smart_input")  
	    p.focus()  
	JS  
	  
	dr.execute_script js
	
	```
	
3. 定位单个对象
	
	```ruby
	:class             => 'class name',  
	:class_name        => 'class name',  
	:css               => 'css selector',  
	:id                => 'id',  
	:link              => 'link text',  
	:link_text         => 'link text',  
	:name              => 'name',  
	:partial_link_text => 'partial link text',  
	:tag_name          => 'tag name',  
	: xpath             => 'xpath', 
	
	```
4. 等待完成
	
	```ruby
	wait = Selenium::WebDriver::Wait.new({:timeout => 30})  
	box = wait.until {dr.find_element(:css => '.red_box')}  
	dr.execute_script('arguments[0].style.border = "5px solid yellow"', box) #div will be h
	```
	
5. 下来列表框
	
	``````ruby
		require 'rubygems'  
		require 'selenium-webdriver'  
		module EasyWrap  
	    class Select  
	        def initialize e  
	            raise NotValidElementError unless e.is_a?(Selenium::WebDriver::Element)  
	            @e = e  
	            child_options  
	        end   
	  
	        def select_by_value value  
	            @ops.each do |op|  
	                op.click if op['value'] == value  
	            end  
	        end  
	  
	        def select_by_index index  
	            @ops[index].click if valid_index? index  
	        end  
	  
	        def select_by_text text  
	            @ops.each do |op|  
	                op.click if op['text'] == text  
	            end  
	        end  
	  
	        def valid_index? index  
	            index.to_i < (@ops.size - 1)  
	        end  
	  
	        def child_options  
	            begin  
	                @ops = @e.find_elements(:tag_name => 'option')  
	            rescue  
	                raise CanNotFindOptionError, "can not find options in #{@o}"  
	                exit  
	            end  
	        end  
	  
	        def options  
	            @ops_text_arr = []  
	            @ops.each do |op|  
	                @ops_text_arr << op['text']  
	            end  
	            @ops_text_arr  
	        end  
	    end   
	  
	    class EasyWrapError < StandardError; end  
	    class NotValidElementError < EasyWrapError; end  
	    class CanNotFindOptionError < EasyWrapError; end  
		end 
		
		s = EasyWrap::Select.new dr.find_element(:id => 's')  
		
		
		选择value是1的option  
		s.select_by_value('1')  
		sleep 2  
		选择index是2的option,也就是第3个option  
		s.select_by_index(2)  
		sleep 2  
		 选择text是Op4的option  
		s.select_by_text('Op4')  
		sleep 3  
		dr.close  
		 
	``````
	
	
6. 截图
	
	```ruby
	dr.save_screenshot '.\Hana.png' 
	```
	
7. 注入jQuery进行辅助测试， 如果页面没有引用jQuery

	
	```ruby
		jquery_helper.rb  
  
		\#encoding: utf-8  
		module JqueryHelper  
		    def load_jquery dr,jquery_path  
		        jq = read_jquery(jquery_path)  
		        jq.force_encoding('utf-8')  
		        dr.execute_script jq  
		    end  
		  
		    def read_jquery(jquery_path)  
		        js = ''  
		        File.open(File.expand_path(jquery_path), 'r') do |f|  
		            js = f.read  
		        end  
		        js  
		    end  
		end  
		  
		fire_event.rb  
		  
		require 'rubygems'  
		require 'selenium-webdriver'  
		require './jquery_helper'  
		include JqueryHelper  
		dr = Selenium::WebDriver.for :firefox  
		
		dr.navigate.to "http://www.google.com"  
		  
		jquery_path = './jquery-1.6.4.min.js'  
		load_jquery dr, jquery_path  
		jq = <<JQ  
		    $("#t").show();  
		JQ  
		  
		dr.execute_script jq 
	
	```
	
	
8. 加载文件
	
	```ruby
	require_relative '../page_objects/homepage'
	
	```
	
9. 使用Test::Unit 的Assert在Cucumber里
	
	```ruby
	require 'test/unit'
	require 'test/unit/assertions'
	
	World(Test::Unit::Assertions)
				
	
	```
10. 我们可以很方便的扩展一些功能，比如

	```ruby
	module Selenium::WebDriver
	  Element.module_eval do
	    def send_text(value)
	      self.clear
	      self.send_keys value+"aa"
	    end
	  end
	end
	
	```

	
	*  参考这个<http://ruby-metaprogramming.rubylearning.com/html/ruby_metaprogramming_3.html>
	
	
Will Add more tips when have new ...
