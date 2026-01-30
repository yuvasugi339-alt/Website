import java.util.*;
class BinarySearch 
{
    public static void main(String args[])
    {
        Scanner sc = new Scanner(System.in);
        int i,k = 0, p = 0, lb = 0, ub = 9;
        System.out.println("Enter the number of elements :");
        int n = sc.nextInt();
        int m[] = new int[n];
        System.out.println("Enter the elements in ascending order :");
        for(i = 0; i < n; i++)
        {
            m[i] = sc.nextInt();
        }
        System.out.println("Enter the element to be searched :");
        int ns = sc.nextInt();
        while(lb <= ub)
        {
            p = (lb + ub) / 2;
            if(m[p] == ns)
            {
                k = 1;
                break;
            }
            else if(m[p] < ns)
            {
                lb = p + 1;
            }
            else
            {
                ub = p - 1;
            }
            if (k == 1)
            {
                System.out.println("Element found at position " + (p + 1));
            }
            else
            {
                System.out.println("Element not found");
            }
        }
        sc.close();
    }
}