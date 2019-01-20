$.Msg("healthbar");

var teamColors = GameUI.CustomUIConfig().team_colors;

if (!teamColors) {
  GameUI.CustomUIConfig().team_colors = {}
  GameUI.CustomUIConfig().team_colors[DOTATeam_t.DOTA_TEAM_GOODGUYS] = "#f4df58;"; //Yellow
  GameUI.CustomUIConfig().team_colors[DOTATeam_t.DOTA_TEAM_BADGUYS ] = "#ff2131;"; //Red
  GameUI.CustomUIConfig().team_colors[DOTATeam_t.DOTA_TEAM_CUSTOM_1] = "#60c0ff;"; //Blue
  GameUI.CustomUIConfig().team_colors[DOTATeam_t.DOTA_TEAM_CUSTOM_2] = "#73ef30;"; //Green
  GameUI.CustomUIConfig().team_colors[DOTATeam_t.DOTA_TEAM_CUSTOM_3] = "#646464;";
  GameUI.CustomUIConfig().team_colors[DOTATeam_t.DOTA_TEAM_CUSTOM_4] = "#646464;";
  GameUI.CustomUIConfig().team_colors[DOTATeam_t.DOTA_TEAM_CUSTOM_5] = "#646464;";
  GameUI.CustomUIConfig().team_colors[DOTATeam_t.DOTA_TEAM_CUSTOM_6] = "#646464;";
  GameUI.CustomUIConfig().team_colors[DOTATeam_t.DOTA_TEAM_CUSTOM_7] = "#646464;";
  GameUI.CustomUIConfig().team_colors[DOTATeam_t.DOTA_TEAM_CUSTOM_8] = "#646464;";

  teamColors = GameUI.CustomUIConfig().team_colors;
}

teamColors[DOTATeam_t.DOTA_TEAM_NEUTRALS] = teamColors[DOTATeam_t.DOTA_TEAM_NEUTRALS] || "#aaaaaa;";
teamColors[DOTATeam_t.DOTA_TEAM_NOTEAM]   = teamColors[DOTATeam_t.DOTA_TEAM_NOTEAM]   || "#aaaaaa;";

function HealthCheck()
{
  var wp = $.GetContextPanel().WorldPanel
  var offScreen = $.GetContextPanel().OffScreen;
  if (!offScreen && wp){
    var ent = wp.entity;
    if (ent){
      if (!Entities.IsAlive(ent)){
        $.GetContextPanel().style.opacity = "0";
        $.Schedule(1/30, HealthCheck);
        return;
      }

      //var pTeam = Players.GetTeam(Game.GetLocalPlayerID());
      var team = Entities.GetTeamNumber(ent);

      // Color by friendly/enemy
      /*if (team == pTeam)
        $.GetContextPanel().SetHasClass("Friendly", true);
      else
        $.GetContextPanel().SetHasClass("Friendly", false);*/

      $.GetContextPanel().style.opacity = "1";
      var hp = Entities.GetHealth(ent);
      var hpMax = Entities.GetMaxHealth(ent);
      var hpPer = (hp * 100 / hpMax).toFixed(0);

      
      for (var i=1; i<=5; i++){
        var pan = $("#HP" + i);
        var perc = Math.min(Math.max(0, hpPer), 20) * 5;

        pan.style.width = perc + "%;";
        pan.style.backgroundColor = teamColors[team];

        hpPer -= 20;
      }
    }
  }

  $.Schedule(1/30, HealthCheck);
}

(function()
{ 
  HealthCheck();

})();