#include<iostream>
#include<vector>
using namespace std;
class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        int num = nums.size();
		vector<int> record;
		for(int i = 0; i < num; i++){
			for(int j = i + 1; j < num; j++){
				if(nums[i] + nums[j] == target){
					record[0] = i;
					record[1] = j;
				}
			}
		}
		return record;
    }
};

int main(){
	int numss[] = {2,7,11,15};
	vector<int> nums(numss,numss + 4);
	int target = 0;
	cout << Solution result(nums, target)<<endl;
}