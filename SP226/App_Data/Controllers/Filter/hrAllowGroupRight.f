<?xml version="1.0" encoding="utf-8"?>

<dir table="hrquyennsd" code="ma_quyen, user_id" order="ma_quyen, user_id" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc dữ liệu" e="Filter Data"></title>

  <fields>
    <field name="ma_quyen" onDemand="true">
      <header v="Quyền sử dụng" e="Access Right"></header>
      <items style="AutoComplete" controller="hrAccessRight" reference="ten_quyen%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_quyen%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="name" onDemand="true">
      <header v="Nhóm" e="Group"></header>
      <items style="AutoComplete" controller="UserGroup" reference="comment%l" key="@@admin = 1 and user_yn = 0 and status = '1'" check="@@admin = 1 and user_yn = 0"/>
    </field>
    <field name="comment%l" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 230"/>
      <item value="1110: [ma_quyen].Label, [ma_quyen], [ten_quyen%l]"/>
      <item value="1110: [name].Label, [name], [comment%l]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9PqATwSz0ntT0CkTWgu9ujCccpAPT8XVdBM5YfBxk6XuA9Tjoi0Kzxd9F640GYMs8YdRMwoKubo3tpe+p4fM0knjmo0LO37npK3P99v/cBF</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf517Pu4LOROIUSt7PHOavMqRalVywliZFCKWprqqhus2WtvKTEm5f12ARs4GlsC0htSQiLPoUSe3yIWepiNXNYDOmcz7mgKr65MNZFVTuWUW</encrypted>]]>
      </text>
    </command>
    
    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6ePvDEiPLJoZDJnB0zrXDojAmdcAG9vBcAGnHvTkBASyrMM0QwlAHp9DkOa1/aOwL48bmwMn6Sz9cWULnmMn0t4jkfype8VCTmx4qkj1mlNsvg4jML6NwALIZBxwB26klAJYk2/3D2dBng3gdo4G4yYs+kCsG/fLSa84m3RkdN7I1mpbhrScxyikYli+v1BjoGC8C/Cq12nq+kAhF103za5WYXRKsAGzFXRZmsBqHAnz</encrypted>]]>
      </text>
    </command>
  </commands>
  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70LO7GKzWZ/rpRLvtBffsrUq2JrZj781MpuLnLGWsEHaPc7U9bUmCwW6BF9Cja4CMuUFwq9Xrd3JuYcjuK9ZPbxJn0Bd4ItCTgSKk7h024a2xydNiJA6mSMzEfky9FjtAAbsbWzwPEAuEyMyhHWYvxtcXvO53ck/wI0ajAmIBZ6tt6cQkdY2k4knvx4OAa3sWJt9AkHM/Skp+qt17Oq14eRTkvFO6nikZsJQMaVVGO4LwlPxwNkM5TMOUDKzdXG9FetCAZCnlha9Y6Gk801qlccqxIIR0HBV3JvHLMDGI6x0NmynLU07LujNRXBiUL56RaH5Z8CXd8EMTs8oJkdHltyZxfE69QwRfFDpl+e5Fqj8LLqjySz+WPnrI9iQWwtCvSKMeb2dw9GEiTrjAfM+8MN+0FtT3eobAPI92MWP9aZT5HnTj4NtlWyl1AETFNQ97axMVVoRsK/rV/t2A0Yw0eGxsqF2wOhObfMPpjE5h+rOLbgmik/sGCn384z/SjDoOpQDAnoEzJOINhQ9/90MlU6lFlJa+ER53EuhgSXzy/NLn8i/hXZzgPHX2Gm4u/4hCSjXFfVWsWD89J4MnT3DTnM0ApcY0iT6K63LHexTV0dFCOyjepQ0tTMIdYMmRYE9HBLgQhRxNnn+sD7WvxJlTKiXIItjdpsL0Yuu4YPgB4bJDZvb+VaNdSON35KOOAp4zocC8PAf9bSCliuack0MVJ5E2mi3/QgK9NIfY13/Q4iQ3</encrypted>]]>
    </text>
  </script>

</dir>