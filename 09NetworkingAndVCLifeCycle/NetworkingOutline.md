## URLSession
- URLSession.shared acts like a singleton
- Makes networking call in the background
- receive (data?, response?, error?) once the call completes


## Codable Protocol
- maps JSON key:value pairs into a swift struct
- enum CodingKeys to re-map JSON keys into a new key
- Custom init to allow for properties that doesn't exist in the JSON

## UI Updates
- networking calls are done on the global queue (lower priority processor)
- UI updates *have* to be done on the main queue (highest priority thread/processor)
- DispatchQueue.main and DispatchQueue.global()
