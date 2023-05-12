require 'rails_helper'


RSpec.configure do |config|
  config.swagger_root = Rails.root.to_s + '/swagger'

  config.swagger_docs = {
    'v1/swagger.json' => {
      openapi: '3.0.1',
      info: {
        title: 'My API',
        version: 'v1'
      },
      paths: {}
    }
  }
end

Rswag::Api.configure do |config|
  config.swagger_root = Rails.root.to_s + '/swagger'
end

Rswag::Ui.configure do |config|
  config.swagger_endpoint = '/api-docs/v1/swagger.json'
end

Rswag::Api::Engine.routes.draw do
  namespace :api do
    namespace :v1 do
      swagger_api 'Blogs API' do
        path '/blogs' do
          operation :get do
            key :summary, 'Get a list of blogs'
            key :operationId, 'getBlogs'
            key :tags, [
              'blog'
            ]
            response 200 do
              key :description, 'List of blogs'
              schema do
                key :type, :array
                items do
                  key :'$ref', :Blog
                end
              end
            end
          end
        end

        path '/blogs/{id}' do
          operation :get do
            key :summary, 'Get a blog by ID'
            key :operationId, 'getBlogById'
            key :tags, [
              'blog'
            ]
            parameter do
              key :name, :id
              key :in, :path
              key :description, 'ID of blog to fetch'
              key :required, true
              key :schema, {
                type: :integer,
                format: :int64
              }
            end
            response 200 do
              key :description, 'Blog response'
              schema do
                key :'$ref', :Blog
              end
            end
            response :default do
              key :description, 'unexpected error'
              schema do
                key :'$ref', :ErrorModel
              end
            end
          end
        end
      end
    end
  end
end
