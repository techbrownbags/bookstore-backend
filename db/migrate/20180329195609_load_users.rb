class LoadUsers < ActiveRecord::Migration[5.1]
  def change
    User.create(email: 'admin@bookstore.local', password: 'fred123', admin: true)
    User.create(email: 'reader@bookstore.local', password: 'password123')

  end
end
