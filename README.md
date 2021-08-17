# OTRS-Config-Item-Read-Only-Field
- Built for OTRS CE V6.0.x / Znuny LTS
- Read only definition field for Config Item
- This patch will extend Config Item definition to has Read Only field.

1. At Config Item definiton, add 'ReadOnly: 1' parameter.
		
	Example: 
	
			- Input:  
				MaxLength: 100  
				Size: 50  
				Type: Text  
				ReadOnly: 1  
			Key: SerialNumber  
			Name: Serial Number  
			Searchable: 1  

	[![Capture.png](https://i.postimg.cc/c13bn7hN/Capture.png)](https://postimg.cc/grYs9Z1M)
