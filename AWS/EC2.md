EC2 
```
- [ ] CloudWatch is all about to monitor performance, CloudTrail is all about auditing, it records all the API calls that are performed on AWS Management console e.g: who created EC2 instance/ s3 bucket… etc.
- [ ] CloudWatch Alarms - Allows to set alarms that notify when particular thresholds are hit.
- [ ] ENI (Network Card) vs ENA (Enhanced Network for Higher I/O performance)vs EFA (Elastic Fabric Adaptor used for ML - only for Linux)
- [ ] Security Groups are Stateful  & are tied to EC2( I.e outbound rules are open by default ), you can add a new rule to allow, but you can’t deny any rules, you can’t restrict rules an IP, NACL are stateless & are tied to subnets, which lets you to add rules to deny & also restrict at IP level
- [ ] Identity Access Management (IAM) - Roles for EC2 instances are more secure than storing ACCESS_KEY_ID and SECRET_ACCESS_KEY on individual instances
- [ ] EC2 BootStrap Scripts - Inject init scripts under USER DATA section
- [ ] Instance Meta Data - CURL HTTP://169.254.169.254/latest/meta-data
- [ ] EFS - When you need distributed storage for linux based instances.
- [ ] Amazon FSx for Windows - When you need Centralized storage for window based applications such as Sharepoint, MSQL, IIS ..etc
- [ ] Amazon Lustre FSx - Specifically designed for fast processing work loads such as MachineLearning, High Performance Computing.. etc
- [ ] Placement Groups: Way of grouping EC2 instances very very close together with in a single Availability Zone, needed for application looking for low network latency, high network throughput.  Spread individual instances go under different hardware
- [ ] AWS DataSync - Install agent on VM (on-premise ) and push all content to EFS/S3/Amazon FSx for Windows
- [ ] AWS WAF - It is a Web Application Firewall that lets you monitor HTTP/HTTPS request that are forwarded to Amazon CloudFront/ Application Load Balancer / API Gateway. It can go till Layer7 and see Query string parameter, where as Physical Hardware firewall can go till Layer 4.
```
