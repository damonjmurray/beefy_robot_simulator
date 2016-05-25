# require all items in lib/beefy_robot_simulator/
Dir[File.dirname(__FILE__) + '/beefy_robot_simulator/*.rb'].each do |file|
  require file
end
