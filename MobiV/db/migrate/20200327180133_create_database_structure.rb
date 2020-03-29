class CreateDatabaseStructure < ActiveRecord::Migration[6.0]
  def change
    create_table "category", primary_key: "Id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
      t.string "Name", limit: 20, null: false
      t.string "Description", limit: 50, null: false
      t.index ["Id"], name: "Id_UNIQUE", unique: true
    end
  
    create_table "customers", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
      t.string "FirstName", limit: 45, null: false
      t.string "LastName", limit: 45, null: false
      t.string "Address", limit: 100
      t.string "Phone", limit: 20
      t.string "UserName", limit: 20, null: false
      t.string "Password", limit: 20, null: false
      t.index ["id"], name: "id_UNIQUE", unique: true
    end
  
    create_table "deliverycompany", primary_key: "Id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
      t.string "Name", limit: 20, null: false
      t.string "Address", limit: 100, null: false
      t.string "Description", limit: 50
      t.string "Phone", limit: 20
      t.index ["Id"], name: "Id_UNIQUE", unique: true
    end
  
    create_table "employees", primary_key: "Id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
      t.string "FirstName", limit: 45, null: false
      t.string "LastName", limit: 45, null: false
      t.string "Address", limit: 100
      t.string "Phone", limit: 20
      t.integer "RoleId", null: false
      t.index ["Id"], name: "Id_UNIQUE", unique: true
    end
  
    create_table "orderlines", primary_key: "Id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
      t.integer "OrderId", null: false
      t.integer "ProductId", null: false
      t.index ["Id"], name: "Id_UNIQUE", unique: true
    end
  
    create_table "orders", primary_key: "Id", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
      t.string "Comments", limit: 200
      t.datetime "Date", null: false
      t.integer "CustomerId", null: false
      t.integer "PaymentMethodId", null: false
      t.integer "DeliveryId", null: false
      t.integer "EmployeeId"
    end
  
    create_table "paymentmethod", primary_key: "Id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
      t.string "Name", limit: 45, null: false
      t.string "Type", limit: 45, null: false
      t.index ["Id"], name: "Id_UNIQUE", unique: true
    end
  
    create_table "products", primary_key: "Id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
      t.string "Name", limit: 45, null: false
      t.string "Description", limit: 45, null: false
      t.integer "Quantity"
      t.integer "CategoryId"
      t.float "Price", limit: 53
      t.index ["Id"], name: "Id_UNIQUE", unique: true
    end
  
    create_table "role", primary_key: "Id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
      t.string "Name", limit: 20, null: false
      t.string "Description", limit: 50
      t.index ["Id"], name: "Id_UNIQUE", unique: true
    end
  end
end
