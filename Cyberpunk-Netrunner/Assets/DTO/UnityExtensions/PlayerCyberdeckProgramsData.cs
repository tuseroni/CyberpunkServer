﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using CyberpunkServer.Models.DTO;
using System;
using UnityEngine;
using UnityEngine.UIElements;

public interface HasUiElement
{
    VisualElement UIElement { get; set; }
}
public interface RunningProgram
{
    ProgramData Program { get; set; }
    int Strength { get; set; }
    bool Rezzed { get; set; }
    int? OwnerID { get; set; }
    int xPos { get; set; }
    int yPos { get; set; }
    int id { get; set; }
    int DeviceID { get; set; }
    string DeviceType { get; set; }
}
public interface ProgramSummoner
{
    Bounds bounds { get; set; }
    int Int { get; set; }
    int Interface { get; set; }
}
namespace CyberpunkServer.Models.DTO
{
    public partial class PlayerCyberdeckProgramsData : HasUiElement, RunningProgram
    {
        public VisualElement UIElement { get; set; }
        public int? OwnerID{ get; set; }

        public int xPos { get; set; }
        public int yPos { get; set; }
        public int DeviceID 
        { 
            get
            {
                return PlayerCyberdeckID.Value;
            }
             set
            {

            }
        }
        public string DeviceType { get; set; } = "Cyberdeck";
    }
}