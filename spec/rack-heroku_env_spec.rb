require File.dirname(__FILE__) + '/spec_helper'

describe Rack::HerokuEnv do
  let(:app) { lambda { |env| [200, { 'Content-Type' => 'text/plain' }, 'Hello'] } }
  let(:env_vars) {
    {
      'HTTP_X_HEROKU_DYNOS_IN_USE' => '1',
      'HTTP_X_HEROKU_QUEUE_DEPTH' => '2',
      'HTTP_X_HEROKU_QUEUE_WAIT_TIME' => '3',
    }
  }
  let(:env) { Rack::MockRequest.env_for('/', env_vars) }

  before { _, @headers, _ = Rack::HerokuEnv.new(app).call(env) }

  it 'adds X-Heroku-Dynos-In-Use response header' do
    expect(@headers).to be_include('X-Heroku-Dynos-In-Use')
  end

  it 'adds X-Heroku-Queue-Depth response header' do
    expect(@headers).to be_include('X-Heroku-Queue-Depth')
  end

  it 'adds X-Heroku-Queue-Wait-Time response header' do
    expect(@headers).to be_include('X-Heroku-Queue-Wait-Time')
  end

  it 'sets HTTP_X_HEROKU_DYNOS_IN_USE value to response header' do
    expect(@headers['X-Heroku-Dynos-In-Use']).to eq('1')
  end

  it 'sets HTTP_X_HEROKU_QUEUE_DEPTH value to response header' do
    expect(@headers['X-Heroku-Queue-Depth']).to eq('2')
  end

  it 'sets HTTP_X_HEROKU_QUEUE_WAIT_TIME value to response header' do
    expect(@headers['X-Heroku-Queue-Wait-Time']).to eq('3')
  end
end
