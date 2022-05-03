## Image Cells

### Registering a Nib (.xib)
- nib is the product of the .xib file
- let nib = UINib(nibname: "FileName", bundle: nil)

### Cells retain their states
- prepare for reuse
- state of the cell should be pass into it since they are reused
- cache images in NSCache

### Cell sizing
- allow the contents inside the cells to determine the cell's height
