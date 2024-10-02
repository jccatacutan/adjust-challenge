# adjust-challenge
Generate /etc/fstab based on a YAML file.

I utilized a Bash script along with yq to generate the /etc/fstab file based on the provided YAML input. The script is simple and straightforward, effectively allowing me to achieve the desired outcome by leveraging yq for YAML manipulation.

Here are three key points to highlight:
1. I've backed up the existing /etc/fstab file, appending a date stamp to easily identify the most recent working backup.
2. Since it's not possible to directly include the root-reserve option in /etc/fstab, I’ve incorporated it into the script instead.
3. Generating the fstab entries is the core function of this script, and the output—attached below—is entirely based on the provided YAML file.

Final Output:
![image](https://github.com/user-attachments/assets/3369d4e6-ca99-4c0f-bc28-43e2fbb88263)


Further information about 'yq', here is their documentation:
https://mikefarah.gitbook.io/yq/how-it-works
