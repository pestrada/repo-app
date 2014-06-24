class MemoryRepository
  include Repository

  def initialize
    @records = {}
  end

  def create(object)
    @records[object.id] = object
  end

  def retrieve(id)
    @records[id]
  end

  def update(model)
    @records[model.id] = model
  end

  def delete(id)
    if @records[id]
      @records[id] = nil
      true
    else
      false
    end
  end

end