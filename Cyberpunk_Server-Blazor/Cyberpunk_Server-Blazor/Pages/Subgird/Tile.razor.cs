using CyberpunkServer.Models;
using CyberpunkServer.Models.DTO;
using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Components.Web;
using System.Collections.ObjectModel;
using System.Collections.Specialized;
using System.Numerics;

namespace Cyberpunk_Server_Blazor.Pages.Subgird
{
	public partial class Tile
	{
		[Parameter] public ObservableCollection<NetItem> ContainedItems { get; set; } = new ObservableCollection<NetItem>();
		[Parameter] public int x { get; set; }
		[Parameter] public int y { get; set; }
		[Parameter] public int gridSize { get; set; } = 20;
		[Parameter] public Dictionary<int, Dictionary<int, Tile>> GridLookup { get; set; } = new Dictionary<int, Dictionary<int, Tile>>();
		[Parameter] public NetItem? SelectedItem { get; set; }
		[Parameter] public Subgrid Grid { get; set; }
        protected override void OnInitialized()
		{
			ContainedItems.CollectionChanged += _containedItem_CollectionChanged;
			if(!GridLookup.ContainsKey(y))
			{
                var newRow = new Dictionary<int, Tile>();
                GridLookup.Add(y, newRow);
            }
			GridLookup[y][x] = this;
			if(ContainedItems.Count>0)
			{
				ContainedItems[0].CurrentTile = this;
			}
        }
		private void handleTileClick(MouseEventArgs e)
		{
			if (SelectedItem != null)
			{
				SelectedItem.xPos = x;
				SelectedItem.yPos = y;
				if(SelectedItem.CurrentTile!=null)
				{
					SelectedItem.CurrentTile.ContainedItems.Remove(SelectedItem);
				}
				SelectedItem.CurrentTile = this;
				ContainedItems.Add(SelectedItem);
			}
			else if(ContainedItems.Count>0)
			{
				Grid.SetSelectedItem(ContainedItems[0]);
			}
		}
		private void _containedItem_CollectionChanged(object? sender, NotifyCollectionChangedEventArgs e)
		{
			InvokeAsync(()=> StateHasChanged());
		}
	}
}
