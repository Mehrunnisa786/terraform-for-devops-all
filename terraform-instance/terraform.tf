terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.39.0"
    }
  }

#ye block terraform folder aur remote-infra ka jo folder h usme jo s3, dynamodb h wo usko connect kara raha h cs
#after terraform init
#configured "s3" backend. Do you want to copy this state to the new "s3"
 # backend? Enter "yes" to copy and "no" to start with an empty state.
backend "s3"{
   bucket = "terra-bucket--secure-states"
   key = "terraform.tfstate"
   region = "us-east-2"
   dynamodb_table = "dynamodb-secure-state"
}
}

#after deleteing manually all the .tfstate, tfstate backend file when you run terfaor state list you
#will still able to see all the state. Beacuse of remote backend
#jo state h wo s3 me store h. 
#we learn how to create remote backend on s3 and linked it with dynamodb table and let go all the local tfstate files  

#ab aws par s3 bucket ke andar .tfstate file present h
