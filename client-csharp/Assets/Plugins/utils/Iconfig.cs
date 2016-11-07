using UnityEngine;
using System.Collections;

public interface IConfig<K>
{
    K GetKey();
}