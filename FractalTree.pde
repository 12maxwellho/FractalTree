private double fractionLength = .87; 
private int smallestBranch = 5; 
private double branchAngle = 0.8;  
private double rand;
public void setup() 
{   
	size(640,480);    
	noLoop(); 
} 
public void draw() 
{   
	background(0);   
	stroke(139,69,19);
	strokeWeight(15);   
	line(320,300,320,420);  
	drawBranches(320,300,100,3*Math.PI/2,0,10);  //will add later
} 
public void drawBranches(int x,int y, double branchLength, double angle, int count, float weight) 
{   
	double angle1 = angle+branchAngle*((Math.random()*0.15)+0.85);
	double angle2 = angle-branchAngle*((Math.random()*0.15)+0.85);
	branchLength = branchLength*fractionLength*((Math.random()*0.2)+0.8);
	int endX1 = (int)(branchLength*Math.cos(angle1))+x;
	int endY1 = (int)(branchLength*Math.sin(angle1))+y;
	int endX2 = (int)(branchLength*Math.cos(angle2))+x; 
 	int endY2 = (int)(branchLength*Math.sin(angle2))+y;   
	line(x,y,endX1,endY1);
	line(x,y,endX2,endY2);
	rand=Math.random();
	count++;
	weight = weight*0.8;

	if(count<7)
	{
		strokeWeight(weight);
		stroke(139,69,19);
	}
	else
	{
		strokeWeight(1);
		stroke(0,255,0);
	}  

	if(branchLength>smallestBranch && rand>0.66)
	{
		drawBranches(endX1,endY1,branchLength,angle1,count,weight);
		drawBranches(endX2,endY2,branchLength,angle2,count,weight);
	}
	else if (branchLength>smallestBranch && rand>0.33)
	{
		drawBranches(endX1,endY1,branchLength,angle1,count,weight);
		drawBranches(endX2,endY2,branchLength,angle1,count,weight);
	}
	else if(branchLength>smallestBranch)
	{
		drawBranches(endX1,endY1,branchLength,angle2,count,weight);
		drawBranches(endX2,endY2,branchLength,angle2,count,weight);
	}
	else
	{
		rand = rand;
	}
}