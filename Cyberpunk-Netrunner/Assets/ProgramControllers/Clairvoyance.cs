using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using CyberpunkServer.Models.DTO;
using System.Linq;
using TMPro;
using System.Threading.Tasks;

class Clairvoyance: ProgramController
{
    public override float radius { get; set; } = 1.0f * 60.0f;
    public override bool DetectInvisibility { get => true; set { } }
}

