<?xml version="1.0" encoding="utf-8"?>

<dir table="userinfo2" code="id" order="id" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Sao chép quyền" e="Copy User Right"></title>

  <fields>
    <field name="user" disabled="true">
      <header v="Người sử dụng" e="User"></header>
      <items style="AutoComplete" controller="UserGroup" key="1=1" check="1=1" reference="user_name%l" information="name$vsysuserinfo.comment%l"/>
    </field>
    <field name="user_name%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="target" allowNulls="false">
      <header v="Sao chép từ" e="Copy From"></header>
      <items style="AutoComplete" controller="UserGroup" reference="target_name%l" key="(user_yn = 1 and admin = 0 and name &lt;&gt; '{$%c[user]}') and (@@admin = 1 or dbo.ff_ExactInlist(name, (select restrict_users from userinfo2 where id = @@userID)) = 1)" check="(user_yn = 1 and admin = 0 and name &lt;&gt; '{$%c[user]}') and (@@admin = 1 or dbo.ff_ExactInlist(name, (select restrict_users from userinfo2 where id = @@userID)) = 1)" information="name$vsysuserinfo.comment%l"/>
    </field>
    <field name="target_name%l" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330"/>
      <item value="111: [user].Label, [user], [user_name%l]"/>
      <item value="111: [target].Label, [target], [target_name%l]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4JyubyntCsvRGhpBc17AjnCV2DuyCgRLsd7a4J+PnAnC6Ky/xWvycpBjOWclo3ITP0iiMPrwoIlQDb4KPaFfWk=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6chuQd+efmhqFzjN3emYzYdtQL8uQqAUvN+8ci3o5D3uEg7kYbLFwQOoF/zzuNd0FE3Iwhkc9CSOzlhvNGfPBlE8v3j1SuR+BFsztQivR1nmkiFuH710wUGdt1YWyj28yqdbBHKPZyK1WDe8c+1Gf3hNkezTMJFeaS1PN5s5BY2dPbZpq9lb2wOVvc/Uy7T6F9FG/u5DDYklogPz6nSXHDUZcOsGHPRdJg6+YL2PGwE/SF3a8/qsU6nf6yPcl9tid2BkI5qqhNjE5Fmu7MSDKrPh1SVPf1rNxRZYtZJFB5axYgb3NBC5OuqxTtfgcZ0Uww==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Pp7JJe0vvY1dpFtr5vgubLd4Q+9NCVH/ZbVCCnlpld2kA44meO53azqbDkmKsOj2to0DJJNrCwRkvIn87LYl/CzgeiHiluBWZ3TdNnGvQP6p4LRLeAMzMIkRek/U3F/eC4fHocmyCruXeJMzlcSvmWgrWN7znJg/19nu0Wo2vMNfEHgX7n4VAB3FHP9GTVEH5aC3HoOpT+sK0gxXGNnny6BcLINyxNwbm4EhXHZMXCu6uhvVbQvkO8kU6FHmzcilkMIhCMjMRFAWxhsuZp0w5VgQ0RnV6ZvZCidcEFR1DqCa77ka5JCfs1KuLbWFF1ebQFpKsPZXY2uJ4/LJxj3kTd954ce2PPiwFCcc+nfZIBCT96G1robyVK75e75b2goDA==</encrypted>]]>
    </text>
  </script>
</dir>