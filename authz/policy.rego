package httpapi.authz

# HTTP API request
import input

# Define admin permissions
admin_roles = ["admin", ]
admin_methods = ["GET", "POST", ]

# Define user permissions
user_roles = ["admin","user", ]
user_methods = ["GET", ]

# Define masking permissions
unmasked_roles = ["admin"]

default allow = false

# Allow any app to get inventory
allow {
  input.method == user_methods[_]
  input.path = ["/opa/items"]
  token.payload.role == user_roles[_]
}

# Allow only admin apps to create inventory
allow {
  input.method == admin_methods[_]
  input.path = ["/opa/items"]
  token.payload.role == admin_roles[_]
}

# Allow unmasked customer data
allow {
  input.path = ["/customers"]
  token.payload.role == unmasked_roles[_]
}

# Helper to get the token payload.
token = {"payload": payload} {
  [header, payload, signature] := io.jwt.decode(input.token)
}
