variable "repo_name"{
    default = {
        reponame1 = "pipelinename1"
        reponame2 = "pipelinename2"
        reponame3 = "pipelinename3"
        reponame4 = "pipelinename4"
    }
    type=map
    description="This is no of times for loop occuring"
}

variable "bucket_name"{
    default = {
        reponame1 = "bucket-epam-systems-pvt-ltd-1"
        reponame2 = "bucket-epam-systems-pvt-ltd-2"
        reponame3 = "bucket-epam-systems-pvt-ltd-3"
        reponame4 = "bucket-epam-systems-pvt-ltd-4"
    }
    type=map
    description="This is no of times for loop occuring"
}
