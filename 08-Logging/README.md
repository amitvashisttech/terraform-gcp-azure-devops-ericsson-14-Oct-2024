## Terraform Native Logs

#### Terraform natively supports logging by using the TF_LOG environment variable. There are multiple log levels available to control verbosity:

#### - TRACE: Detailed information, useful for debugging.
#### - DEBUG: Information that's useful to developers or support engineers.
#### - INFO: General information about the process.
#### - WARN: Potential issues that aren't errors but might require attention.
#### - ERROR: Issues that prevent Terraform from proceeding.

#### You can enable logging by setting the TF_LOG variable:
```
export TF_LOG=DEBUG
```

#### To log to a file instead of the console, you can use TF_LOG_PATH:
```  
export TF_LOG_PATH=/path/to/log/file.log
```

#### Now Apply & check the logs.
```
terraform apply --auto-approve
```