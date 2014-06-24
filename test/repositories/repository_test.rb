require 'test_helper'
require 'MemoryRepository'
require 'User'

class RepositoryTest < ActiveSupport::TestCase

  def setup
    @repository = MemoryRepository.new
  end

  def fake_user
    User.new(id: 1, name: 'foobar', created_at: Time.zone.now)
  end
  
  test "create user" do
    saved_user = @repository.create(fake_user)

    assert saved_user.name == 'foobar'
  end

  test "retrieve existing user" do
    @repository.create(fake_user)
    user = @repository.retrieve(fake_user.id)

    assert user != nil
  end

  test "retrieve non existing user" do
    user = @repository.retrieve(1)
    assert user == nil
  end

  test "update a user" do
    new_user = @repository.create(fake_user)
    user = @repository.retrieve(new_user.id)
    user.name = 'new awesome name'

    updated_user = @repository.update(user)
    assert updated_user.name == 'new awesome name'
  end

  test "delete a user" do
    user = @repository.create(fake_user)

    deleted = @repository.delete(user.id)
    assert deleted == true
  end

end
