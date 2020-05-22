# OTRS-Config-Item-Read-Only-Field
- Built for OTRS CE V6.0.x
- Read only definition field for config item
- This modification will extend Config Item definition to has Read Only field.

1. You are required to modify the existing LayoutText.pm file (do it at Custom directory please).

2. At Config Item definiton, add 'ReadOnly: 1' parameter.
		
	Example: 
	
			- Input:  
				MaxLength: 100  
				Size: 50  
				Type: Text  
				**ReadOnly: 1**  
			Key: SerialNumber  
			Name: Serial Number  
			Searchable: 1  

	[![Capture.png](https://i.postimg.cc/c13bn7hN/Capture.png)](https://postimg.cc/grYs9Z1M)
