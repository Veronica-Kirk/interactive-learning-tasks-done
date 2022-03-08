#Create VPC
resource "aws_vpc" "aws_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
      Team = "DevOps"
      Environment = "Dev"
  }
}


#create public subnets

resource "aws_subnet" "public-1" {
  vpc_id = aws_vpc.aws_vpc.id   #copy the vpc name
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-west-1a"

  tags = {
      Team = "DevOps"
      Environment = "Dev"
  }
}

resource "aws_subnet" "public-2" {
  vpc_id = aws_vpc.aws_vpc.id   #copy the vpc name
  cidr_block = "10.0.2.0/24"
  availability_zone = "eu-west-1b"

  tags = {
      Team = "DevOps"
      Environment = "Dev"
  }
}

resource "aws_subnet" "public-3" {
  vpc_id = aws_vpc.aws_vpc.id   #copy the vpc name
  cidr_block = "10.0.3.0/24"
  availability_zone = "eu-west-1c"

  tags = {
      Team = "DevOps"
      Environment = "Dev"
  }
}

#Create Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.aws_vpc.id   #copy the vpc name

tags = {
      Team = "DevOps"
      Environment = "Dev"
  }
}

# Create Public Route Table

resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.aws_vpc.id

  route {
    cidr_block = "0.0.0.0/0"     #will send all trafic to this ip
    gateway_id = aws_internet_gateway.gw.id  #gw is the name of the Internet Gateway
  }

  tags = {
      Team = "DevOps"
      Environment = "Dev"
  }
}

 #Associate the Route Table with Public Subnet 

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public-1.id
  route_table_id = aws_route_table.public-route-table.id   #copy route table from above, remove quotes and put . and .id at the end
  }

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.public-2.id
  route_table_id = aws_route_table.public-route-table.id   #copy route table from above, remove quotes and put . and .id at the end
  }

  resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.public-3.id
  route_table_id = aws_route_table.public-route-table.id   #copy route table from above, remove quotes and put . and .id at the end
  }

  # Create Public Subnets
  resource "aws_subnet" "private-1" {
  vpc_id = aws_vpc.aws_vpc.id   #copy the vpc name
  cidr_block = "10.0.101.0/24"
  availability_zone = "eu-west-1a"

  tags = {
      Team = "DevOps"
      Environment = "Dev"
  }
}

resource "aws_subnet" "private-2" {
  vpc_id = aws_vpc.aws_vpc.id   #copy the vpc name
  cidr_block = "10.0.102.0/24"
  availability_zone = "eu-west-1a"

  tags = {
      Team = "DevOps"
      Environment = "Dev"
  }
}

resource "aws_subnet" "private-3" {
  vpc_id = aws_vpc.aws_vpc.id   #copy the vpc name
  cidr_block = "10.0.103.0/24"
  availability_zone = "eu-west-1a"

  tags = {
      Team = "DevOps"
      Environment = "Dev"
  }
}

# Create EIP

resource "aws_eip" "nat" {
  vpc     = true

tags = {
      Team = "DevOps"
      Environment = "Dev"
  }
}
 
# Create NAT

resource "aws_nat_gateway" "gw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public-1.id

tags = {
      Team = "DevOps"
      Environment = "Dev"
  }
}

# Create Private Route Table

resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.aws_vpc.id

  route {
    cidr_block = "0.0.0.0/0"     #will send all trafic to this ip
    gateway_id = aws_nat_gateway.gw.id  #gw is the name of the Internet Gateway
  }

  tags = {
      Team = "DevOps"
      Environment = "Dev"
  }
}

# Point Private subnet to private route table

resource "aws_route_table_association" "private-1" {
  subnet_id      = aws_subnet.private-1.id
  route_table_id = aws_route_table.private-route-table.id   #copy route table from above, remove quotes and put . and .id at the end
  }

resource "aws_route_table_association" "private-2" {
  subnet_id      = aws_subnet.private-2.id
  route_table_id = aws_route_table.private-route-table.id   #copy route table from above, remove quotes and put . and .id at the end
  }

  resource "aws_route_table_association" "private-3" {
  subnet_id      = aws_subnet.private-3.id
  route_table_id = aws_route_table.private-route-table.id
  }

