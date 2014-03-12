Before do |scenario|
  # The +scenario+ argument is optional, but if you use it, you can get the title,
  # description, or name (title + description) of the scenario that is about to be
  # executed.
  puts "Jack:"+scenario.title

end

After do |scenario|
  # Do something after each scenario.
  # The +scenario+ argument is optional, but
  # if you use it, you can inspect status with
  # the #failed?, #passed? and #exception methods.

  if(scenario.failed?)
    subject = "Jack -test-failed info #{scenario.exception.message}"
    puts subject
  end

  Cucumber.wants_to_quit = true if scenario.failed?
end


AfterStep do |scenario|
  # Do something after each step.
  puts "after-each-step"
end



# For OR tags, pass the tags in a single string comma separated:

# Before('@cucumis, @sativus') do
#   # This will only run before scenarios tagged
#   # with @cucumis OR @sativus.
# end
# For AND tags, pass the tags as separate tag strings:

# Before('@cucumis', '~@sativus') do
#   # This will only run before scenarios tagged
#   # with @cucumis AND NOT @sativus.
# end
# You create complex tag conditions using both OR and AND on tags:

# Before('@cucumis, @sativus', '@aqua') do
#   # This will only run before scenarios tagged
#   # with (@cucumis OR @sativus) AND @aqua 
# end
# After Step example:

# AfterStep('@cucumis', '@sativus') do
#   # This will only run after steps within scenarios tagged
#   # with @cucumis AND @sativus.
# end


# Running a Before hook only once

# If you have a hook you only want to run once, use a global variable:

# Before do 
#   if !$dunit 
#     # do it
#     step "run the really slow log in method" 
#     $dunit = true 
#   end 
# end 