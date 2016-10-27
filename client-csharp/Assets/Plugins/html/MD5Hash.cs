namespace Engine
{
    using System;
    using System.Collections.Generic;
    using System.IO;
    using System.Text;
    using System.Security.Cryptography;

    public static class MD5Hash
    {
        public static string Get(string input)
        {
            return Get(Encoding.Default.GetBytes(input));
        }

        public static string Get(byte[] input)
        {
            MD5 md5Hasher = MD5.Create();
            byte[] data = md5Hasher.ComputeHash(input);
            StringBuilder stringBuilder = new StringBuilder();
            for (int i = 0; i < data.Length; i++)
                stringBuilder.Append(data[i].ToString("x2"));
            return stringBuilder.ToString();
        }

        public static string Get(Stream stream)
        {
            MD5 md5 = MD5.Create();
            byte[] data = md5.ComputeHash(stream);
            StringBuilder stringBuilder = new StringBuilder();
            for (int i = 0; i < data.Length; i++)
                stringBuilder.Append(data[i].ToString("x2"));
            return stringBuilder.ToString();
        }
    }
}