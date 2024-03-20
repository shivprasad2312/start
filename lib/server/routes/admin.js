const express=require("express");
const adminRouter=express.Router();
const admin=require("../middleware/admin");
const Product = require("../models/product");

adminRouter.post('/admin/add-product',admin ,async  (req,res)=>{
    try {
        const{name,from,to,price,no,time,images}= req.body;

        let product=new Product({
            name,
            from,
            to,
            price,
            time,
            images
        })

        product=await product.save();
    } catch (e) {
        res.status(500).json({error:e.message})
    }
})


adminRouter.get("/admin/get-products",admin,async (req,res)=>{
    try {
        const products=await Product.find({});
        res.json(products);
        
    } catch (e) {
        res.status(500).json({error: e.message});
    }
})


adminRouter.post("/admin/delete-product",admin,async (req,res)=>{
    try {
        const {id}=req.body;
        let product=await Product.findByIdAndDelete(id);
     
        res.json(product);  
    } catch (e) {
        res.status(500).json({error: e.message});
    }
})

module.exports=adminRouter;
     