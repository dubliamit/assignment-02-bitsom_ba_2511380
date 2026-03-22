// OP1: insertMany() — insert all 3 documents from sample_documents.json

db.products.insertMany([
  {
    _id: 1,
    product_name: "Dell Inspiron 15",
    category: "Electronics",
    brand: "Dell",
    price: 65000,
    specifications: {
      processor: "Intel i5",
      ram: "16GB",
      storage: "512GB SSD",
      voltage: "220V"
    },
        warranty: {
        period: "1 year",
        type: "On-site"
    },
        ratings: {
        average: 4.5,
        reviews_count: 1200
    },
        available_colors: ["Silver", "Black"]
},
 
  {
    _id: 2,
    product_name: "Men's T-Shirt",
    category: "Clothing",
    brand: "Puma",
    price: 999,
    sizes_available: ["S", "M", "L", "XL"],
    material: "100% Cotton",
    color_options: ["Red", "Blue", "Black"],
    fit_type: "Regular",
    care_instructions: {
    wash: "Machine wash",
    dry: "Do not tumble dry"
    },
    ratings: {
    average: 4.2,
    reviews_count: 350
   }
},
  {
    _id: 3,
    product_name: "Milk",
    category: "Groceries",
    price: 60,
    expiry_date:"2024-12-20",
    manufacturing_date: "2026-03-15",
    nutritional_info: {
    calories: 150,
    protein: "8g",
    fat: "8g",
    carbohydrates: "12g"
    },
    storage_instructions: "Keep refrigerated",
    ratings: {
    average: 4.6,
    reviews_count: 2200
    }
}
]);


// OP2: find() — retrieve all Electronics products with price > 20000

db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});


// OP3: find() — retrieve all Groceries expiring before 2025-01-01

db.products.find({
  category: "Groceries",
  expiry_date: { $lt: new Date("2025-01-01") }
});


// OP4: updateOne() — add a "discount_percent" field to a specific product

db.products.updateOne(
  { _id: 1 },
  { $set: { discount_percent: 10 } }
);


// OP5: createIndex() — create an index on category field

db.products.createIndex({ category: 1 });


// Explanation:
// Index on "category" improves query performance by allowing faster filtering
// instead of scanning the entire collection.
