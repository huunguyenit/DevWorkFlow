<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir table="sysunitlimits2" code="ma_dvcs, user_id" order="ma_dvcs, user_id" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc chi tiết theo đơn vị cơ sở" e="Unit Filter"></title>
  <fields>
    <field name="ma_dvcs" allowNulls="false">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="ma_dvcs in (select ma_dvcs from dmdvcs where @@admin = 1 or ma_dvcs in (select ma_dvcs from sysunitlimits2 where user_id = @@userID) and status = '1')" check="ma_dvcs in (select ma_dvcs from dmdvcs where @@admin = 1 or ma_dvcs in (select ma_dvcs from sysunitlimits2 where user_id = @@userID))"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZU2iaP3joFV7bsoAUJw06MC+R+C++O70kp7W3tadjKqTLHWByuQWekiALmg4jmNInqglhwy/izfEpa9MBLhFj8I=</encrypted>]]></clientScript>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 230"/>
      <item value="1110: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4VuFPF1t1KJ0rbTt59QilaYw+jIgChxFmNuxSQymkFXu4pxILZ5QmO30EzdrC84yXs6yY/M8aWCcm8Lasued0GcMsDmxnzXorcAMeGQcTs5</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfz+lAk4uyUxR8Of1eg0k6TPkL6Yvs+O2gWnbP7QzVsm88qZqOc8KkEtUU2cTPFzbB4UYn1lsyz4WpcoT4hEJvieXMj3a/9ke2G6sKhqzng4Q</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Bt9vAk92CgPHYyvc2gM2U/OWxoi6RlHXpk6cY+MkYlO5hk0eKjBIACJgsW6q4xO/SIgGKSPfn4G9ub7f7JZy7k3yDKXYjwUlerS+J0FMsqOAjW2w+FvxZ+6pOk9pqIDwf9vnS5FZNgi2RmGLtR88MJJhAEdmWFzTiHLhdruPWhBiqFOp8BgqXWn8Jpfj9TngWGiLxyDvL9Mo3CUajabkLlLo7hlrTVSh0oV+x3FOvWopBr9BeR1E2tLE4DWuJOG02Ak0Fyw8eMhI6gd0jbZdwe+n4f56RnwGSflKER0SryT32tbByuX4UJAuOufY3aSWfVnnL/an2vme3XF2uYpn/fzBDN910pM9UbHhrvTYP/sNYybpaUKovAnXxvnkbc/g58s5rtxVim+uMjuIlyGGiQi/gTiRobgpR5viqqrZSubD68WSK81+AXqhwI3jqGxIE5wGfErHDc/vNGvaP873ADImbZgZdkZLngw4kNmUODtzaRlKGQF+Z1ZBskEfCMYKLgHtgwmRGSCQJgbm5/nw11+TPLiugU89SmIGeXAfDJRCffBIOskow3Nd6tJInCq/prqIAJAg0RdUoqPH+amFWfO7XMNuO57Yq6lbGGaq/XfJlfpLY3Z3j1arLSAD4sfurHAXoBFWLI60pqydRFwxEiSkPlmRt0wZSv/etHIwgY/qAZzK+0ZTXN/jUhlqgXeIQ==</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetOwnerRight">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6U5FV9VZVql4xjRYxGI5fhWj0xCUoaVqpk/ujCbigcvzvHtWiP5E4yrUL0QFl0xH0w6jbSLvZ7Ogm2gEtRaA3d2cilNzUvHNcXTbAID6yOf0YXz9V2JcgNQM+Kp8X0wRtU1NaiZhdDtsvuBRIXQDUshIEwGhRJ2Ms7wlx0wyKu1F2tNetKNzTWHMSRVrbwc2qktfgMd9c5cGXrA3ZBLycGL6DDqdR/eeyRYkYgJeqxKxK51gBw441PeWuobUvsBOUnNdtv5wVg0wbn+fTLPteC/Cpw61b3O++n++DQvEyR1mBwpQN0i1F+58emX5pujg0A==</encrypted>]]>
      </text>
    </action>
  </response>
</dir>