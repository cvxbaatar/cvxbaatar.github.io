library("ggplot2")
library("Cairo")
library("reshape2")


a<-read.csv("tourists.csv", header=TRUE)
a

p<-ggplot(data=a, aes(x=ID,y=Эрэг.дээр.очих)) + geom_bar(stat="identity")
p

b<-melt(a)
b
p<-ggplot(data=b, aes(x=ID,y=value,fill=variable)) + geom_bar(stat="identity", position=position_dodge())
p + labs(title="Амралт чөлөөт цагийн үйл ажиллагаа",
        x ="Жуулчид [-]", y = "Зарцуулсан хугацаа [цаг]", fill="Үйл ажиллагааны төрөл") +
theme(
plot.title = element_text(color="red", size=14, face="bold.italic"),
axis.title.x = element_text(color="blue", size=14, face="bold"),
axis.title.y = element_text(color="#993333", size=14, face="bold")
 )

ggsave("example1.pdf", device=cairo_pdf)

a<-read.csv("workforce.csv", header=TRUE)
colnames(a)<-c("Салбар", 1850, 2020)

b<-melt(a)
b
p<-ggplot(data=b, aes(x=Салбар,y=value,fill=variable)) + geom_bar(stat="identity", position=position_dodge())
p + labs(title="Янз бүрийн салбарт Канадын ажиллах хүчний хуваарилалт",
        y ="Эзлэх хувь [%]", x = "Салбар [-]", fill="Судалсан хугацаа") + theme_minimal()

ggsave("example2.pdf", device=cairo_pdf)
#The bar chart shows the percentages of the Canadian workforce in five major industries in 1850 and 2020.
#Summarise the information by selecting and reporting the main features, and make comparisons where relevant.

