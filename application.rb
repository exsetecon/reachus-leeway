require 'net/http'
require 'mandrill'
before do
      content_type :json
      headers 'Access-Control-Allow-Origin' => '*',
              'Access-Control-Allow-Methods' => ['POST']
end

    set :protection, false
    set :public_dir, Proc.new { File.join(root, "_site") }

post '/send_email' do
    m = Mandrill::API.new settings.api_key_mandrill_cnt
    template_name = settings.tag_mandrill_cnt
    template_content = [{
    :name => 'name',
    :content => params[:name]
    },
    {
     :name => 'email',
     :content => params[:email]
    },
    {
    :name => 'message',
    :content => params[:message]
    }]
      message = {"to"=>
        [{"email"=>settings.email_mandrill_cnt,
            "type"=>"to",
            "name"=>"Leeway"}],
          "subject"=>settings.subject_message_mandrill_cnt}
    resp=m.messages.send_template template_name, template_content, message
    puts resp
    if resp[0]['status'] == 'sent' || resp[0]['status'] == 'queued'
      { :message => 'success' }.to_json
    else
      { :message => 'failure_email' }.to_json
    end
end

post '/send_resume' do
    m_crs = Mandrill::API.new settings.api_key_mandrill_crs
    template_name_crs = settings.tag_mandrill_crs
    template_content_crs = [{
            :name => 'name',
            :content => params[:name]
            },
        {
            :name => 'mobile',
            :content => params[:mobileNo]
            },
        {
            :name => 'address',
            :content => params[:address]
            },
        {
            :name => 'city',
            :content => params[:city]
            },
        {
            :name => 'email',
            :content => params[:email]
            },
        {
            :name => 'experience',
            :content => params[:experience]
            },
        {
            :name => 'salary',
            :content => params[:salary]
            }]
    message_crs = {"to"=>
            [{"email"=>settings.email_mandrill_crs,
                "type"=>"to",
                "name"=>"Exsete"}],
            "attachments"=>
            [{"type"=>params[:Mime],
                "name"=>params[:fileName],
                "content"=>params[:fileData]}],
        "subject"=>settings.subject_message_mandrill_crs}
    resp_crs=m_crs.messages.send_template template_name_crs, template_content_crs, message_crs
    puts "response"
    puts resp_crs
    if resp_crs[0]['status'] == 'sent' || resp_crs[0]['status'] == 'queued'
        { :message => 'success' }.to_json
    else
        { :message => 'failure_email' }.to_json
    end
end

not_found do
  { :message => 'inside not_found' }.to_json
end

get '/*' do
  file_name = "#{request.path_info}/index.html".gsub(%r{\/+},'/')
  if File.exists?(file_name)
    File.read(file_name)
  else
    raise Sinatra::NotFound
  end
end
