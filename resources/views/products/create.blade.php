<h1>Create Product</h1>

<form action="/products" method="POST">
    @csrf
   Name : <input type="text" name="name"> <br>
   Deskripsi : <input type="text" name="description"> <br>
   Price : <input type="number" name="price"> <br>
   Image ERL : <input type="Text" name="image_url"> <br>

    <button type="submit">Save</button>
</form>