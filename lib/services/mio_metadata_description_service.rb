require_relative 'mio_ws_client'
require_relative '../../test/data/ws_user'

class MioMetadataDescriptionService < MioWSClient

  def initialize(user=WSUser.new, url=nil)
    url = url.nil? ? 'https://master.dev.nativ-systems.com/api/metadataDefinitions' : url
    super(user, url)
  end

  def retrieve_descriptions
    retrieve_metadata
  end

  def retrieve_description_by_name(name)
    response = retrieve_metadata['metadataDefinitions']
    response.each do |description|
      if description['name'] == name
        return description
      end
    end
  end

  def retrieve_id_with_name(name)
    retrieve_description_by_name(name)['id']
  end

end