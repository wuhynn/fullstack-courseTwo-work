require_relative '../config/environment'

# Use Active Record Model methods to implement the following methods.
class Assignment

  #
  # Insert rows in DB
  #
  def create_user(params)
      # accept a hash of user properties (`:username` and `:password_digest`)
      # as an input parameter. Note these are 100% same as model class.
      # use the User Model class to create a new user in the DB
      # return an instance of the class with primary key (`id`), and
      # dates (`created_at` and `updated_at`) assigned
      user = User.create(:username => params[:username], :password_digest => params[:password_digest])

      return user
  end

  def create_todolist(params)
      # accept a hash of todolist properties (`:name` and `:due_date`) as
      # an input parameter. Note these are not 100% the same as Model class.
      # use the TodoList Model class to create a new user in the DB
      # return an instance of the class with primary key (`id`), and
      #  dates (`created_at` and `updated_at`) assigned
      list = TodoList.create(:list_name => params[:name], :list_due_date => params[:due_date])

      return list
  end

  #
  # Retrieve paginated results from DB
  #
  def find_allusers(offset, limit)
      # accept offset and limit input parameters
      # use the User Model class to find all Users,
      # ordered by `updated_at` ascending, with specified row offset and row limit
      # return a collection of User instances that represent the specified rows
      users = User.all.order('updated_at').limit(limit).offset(offset)

      return users
  end

  def find_alllists(offset, limit)
      # accept offset and limit input parameters
      # use the TodoList Model class to find all TodoLists, ordered by `list_due_date` descending, with specified row offset and row limit
      # return a collection of TodoList instances that represent the specified rows
      list = TodoList.all.order('list_due_date DESC').limit(limit).offset(offset)

      return list
  end

  #
  # Query DB with exact match
  #
  def find_user_byname(username)
      # accept a username input parameter
      # use the User Model class to find all Users with the supplied username.
      # Username is not unique in the Users table, thus you can have many users with the same username.
      # return a collection of User instances that match the provided username
      user = User.all.where(username: username)

      return user
  end

  def find_todolist_byname(name)
      # accept a name input parameter
      # use the TodoList Model class to find all TodoLists with the supplied list_name.
      # NOTE: List name is not required to be unique, thus you can have many lists with the same list name.
      # return a collection of TodoList instances that match the provided name
      list = TodoList.all.where(list_name: name)

      return list
  end

  #
  # Get rows from DB by PK
  #
  def get_user_byid(id)
      # accept an id input parameter
      # use the User Model class to get the User associated with the `id` primary key
      # return the User instance that matches the provided id
      getUser = User.find(id)

      return getUser
  end

  def get_todolist_byid(id)
      # accept an id input parameter
      # use the TodoList Model class to get the TodoList associated with the `id` primary key
      # return the TodoList instance that matches the provided id
      getList = TodoList.find(id)

      return getList
  end

  #
  # Update rows in DB
  #
  def update_password(id, password_digest)
      # accept an id and password_digest input parameters
      # use the User Model class to update the `password_digest` for the User associated with the id primary key
      # (no return is required)
      newPw = User.find(id).update(password_digest: password_digest)

      return newPw
  end

  def update_listname(id, name)
      # accept an id and name input parameters
      # use the TodoList Model class to update the `list_name` for the TodoList associated with id primary key
      # (no return is required)
      update = TodoList.find(id).update(list_name: name)

      return update
  end

  #
  # Delete rows from DB
  #
  def delete_user(id)
      # accept an id input parameter
      # use the User Model class to remove the User associated with the `id` primary key from the database
      # (no return is required)
      User.delete(id)
  end

  def delete_todolist(id)
      # accept an id input parameter
      # use the TodoList Model class to remove the TodoList associated with the `id` primary key.
      # (no return is required)
      TodoList.delete(id)
  end
end
