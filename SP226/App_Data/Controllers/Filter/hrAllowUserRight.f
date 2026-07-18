<?xml version="1.0" encoding="utf-8"?>

<dir table="hrquyennsd" code="ma_quyen, user_id" order="ma_quyen, user_id" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc dữ liệu" e="Filter Data"></title>

  <fields>
    <field name="ma_quyen" onDemand="true">
      <header v="Quyền sử dụng" e="Access Right"></header>
      <items style="AutoComplete" controller="hrAccessRight" reference="ten_quyen%l" key="@@admin = 1 or ma_quyen in (select ma_quyen from hrquyennsd where user_id = @@userID) and status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_quyen%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="name" onDemand="true">
      <header v="Người sử dụng" e="User"></header>
      <items style="AutoComplete" controller="UserGroup" reference="comment%l" key="(@@admin = 1 or patindex('&#37;,' + rtrim(name) + ',&#37;', (select ',' + replace(restrict_users,' ','') + ',' from userinfo2 where id = @@userID and restrict_yn = '1')) &lt;&gt; 0) and admin = 0 and user_yn = 1 and status = '1'" check="(@@admin = 1 or patindex('&#37;,' + rtrim(name) + ',&#37;', (select ',' + replace(restrict_users,' ','') + ',' from userinfo2 where id = @@userID and restrict_yn = '1')) &lt;&gt; 0) and admin = 0 and user_yn = 1"/>
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
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf/yiI3N5fBxvURRXBi4ToNg7ZSFaOKWqRV/9bz4WePENbzpOqG+j3TN7jk+FjR05uF7XwIxw3QwazD5AkTxC9AZk4QBL33m/KHsw6m3nXOE/</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+XUj8psneUgN8q+8rzL7lWaWi5HBtxi2XBf4C2UgefaIJQaSuDDHuAPXmsszeg2hkEozSOkOlDtzBKLFpDru04=</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70JdKjIJNJa7poYPFTe8LQkVct6DIXPdnxQhOJ+DNHQKUghAhEjBE+ivMyy26Gyt3dhtmPGT9qkgZ3ZEQAdPisJr1UGGXJU7D1tpQPPTpVXnio5nPeQ5cCo1FxV6CEIdlwLA0Q3d8r71jx0PIzoVe/83sEFxDNoZxxZA261Pu/HpXp/WDW7k7L9f+rSKHYhsIw/uCykne2ZIe5I0HE0xKh2IsSrv8g4bKm8BBABgRfA5KQHT+jf7YPU0Hnu5eyv4fAEYHuMCTXsOiiHYEpw1KFe2ZpV2AQH1cFjfsXN4gq3gwQan9hiiV4T9j6YV3/wrayFA3D/YpC52WJHLRy35ut7ISuxcY/ZqYCeH8fQ2jATHmNj3uI6PL0XazodIpuSi64DRDDP8UITTAenhivqHSx9iroGtL7wnAa52Uw+OT3ysebTCqdnM6WIAlOq7NvUdDVcmqGpfopby2C6Hdz7EYhcbSg87Xstly0x2Y4EQQAKDxCXWZMSDl9k2FOvsjvPR45732kVds2xXuVQIgu7VWCThJKxPtHJMQmNJpmTQ4lNnKyfJJ03Uryj6bMBfENYPpgE/xt7zZcmGZaqVz82CYGmuVBCVyvNOA+XU1zmzzvjLjdoQmig9YRqdfJU5cM5cPEV5AHUGirc3gERcsU5tx1MWe5f8KYg6e4fa+njCTZ0GokXjzxShXJ5EWPe9IRj7CniMKgZyUkRXw5xc4tVbtkWY=</encrypted>]]>
    </text>
  </script>
</dir>