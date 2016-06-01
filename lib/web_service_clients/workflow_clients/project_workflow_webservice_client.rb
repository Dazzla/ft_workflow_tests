# frozen_string_literal: true
require_relative 'workflow_webservice_client'
require_relative '../../../test/data/ws_user'
require_relative '../../../config/mio_constants'

##
# Handles creation of Project Workflows
class ProjectWorkflowWebserviceClient < WorkflowWebserviceClient

  def initialize(user=WSUser.new, url="#{MioConstants::ROOT_URL}/api/workflows/")
    super
    @object_type = :project_workflow
    @url = url
  end

  # Wrapper to create project with self.create_project_workflow_payload
  #
  # @return [Hash] created project object converted from JSON service response
  def create_project_workflow(payload=create_project_workflow_payload)
    create_resource(payload)
  end

  ##
  # Retrieve an existing ProjectWorkflow by id
  #
  # @param id [String]
  # @return [Hash] workflow description
  def retrieve_project_workflow(id)
    @url = "#{@url}#{id}"
    retrieve_resource
  end

  private

  # Builds the payload to create a project workflow
  #
  # @param project_name [String] project name. Must be unique within mio
  # @return [Hash] payload for RestClient to convert to JSON and pass to Mio to create workflow
  # noinspection RubyInstanceMethodNamingConvention
  def create_project_workflow_payload(project_name=random_string(6))
    {
      definitionId:    12_387,
      stringVariables: {
        projectMetadata: "{\"project\": \"#{project_name}\",\"section\": \"#{MioConstants::DEFAULT_SECTION}\","\
    "\"brand\": \"#{MioConstants::DEFAULT_BRAND}\"}"
      }
    }
  end

end