import urbanairship as ua

airship = ua.Airship(app_key, master_secret)
push = airship.create_push()
push.audience = ua.all_
push.notification = ua.notification(alert="Hello iOS! I am an API")
push.device_types = ua.device_types('ios')
push.send()
print("Sent notification to all iOS devices")
