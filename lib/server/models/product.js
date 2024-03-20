const mongoose=require("mongoose");

const productSchema=mongoose.Schema({
    name:{
        type:String,
        require:true,
        trim:true,
    },

    from:{
        type:String,
        require:true,
        trim:true,
    },

    to:{
        type:String,
        require:true,
        trim:true,
    },

    price:{
        type:String,
        require:true,
    },

    images:[
        {
            type:String,
            require:true,
        }
    ],

    time:{
        type:String,
        require:true,
    },
})

const Product = mongoose.model("Product", productSchema);
module.exports = Product;
