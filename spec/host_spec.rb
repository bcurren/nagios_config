require 'nagios_config'

describe Host do
  before(:each) do
    @parser = NagiosConfigParser.new
  end
  
  it "should parse host" do
    file = 'define host {
      host_name      computername.example.com
      alias          computername
      display_name   My Computer
      address        192.168.10.1
      parents        computername2.example.com
      hostgroups     group1, group2
      check_command  check_something
    }'
    
    result = @parser.parse(file)
    objects = result.build
    objects.size.should == 1
    
    host = objects.first
    host.kind_of?(Host).should be_true
    host.host_name.should == "computername.example.com"
    host.alias.should == "computername"
    host.display_name.should == "My Computer"
    host.address.should == "192.168.10.1"
    host.parents.should == "computername2.example.com"
    host.hostgroups.should == "group1, group2"
    host.check_command.should == "check_something"
  end
  
  it "should ignore text after a semicolon" do
    result = @parser.parse("define host {
      host_name   myhostname; this is a host name comment
    }")
    
    objects = result.build
    
    host = objects.first
    host.host_name.should == "myhostname" 
  end
end