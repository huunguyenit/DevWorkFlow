<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="kbtknd" code="ma_loai" order="ma_loai" xmlns="urn:schemas-fast-com:data-dir">
  <title v="tài khoản ngầm định" e="Account Definition"></title>
  <fields>
    <field name="ma_loai" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã loại" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_loai" allowNulls="false">
      <header v="Tên loại" e="Description"></header>
    </field>
    <field name="ten_loai2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ds_tk" allowNulls="false">
      <header v="Danh sách tài khoản" e="Account List" />
      <items style="Lookup" controller="Account" key="status = 1" check="1=1" information="tk$dmtk.ten_tk%l"/>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>

  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100,130"/>
      <item value="110: [ma_loai].Label, [ma_loai]"/>
      <item value="110000: [ten_loai].Label, [ten_loai]"/>
      <item value="110000: [ten_loai2].Label, [ten_loai2]"/>
      <item value="110000: [ds_tk].Label, [ds_tk]"/>
      <item value="111000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDHwyWdnnAsOePGxNOFkX1fJQd/FfKDWHOQalUkJPvKwOHJLIPX5lxe5g6mo8Mjk1F+WcdYIlqeUdVmyOzp+04SGlsqkWaz5q6bMqPPmKgXG</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcBYezWCrEMH1fHatEHfnpceRzeD6btN2/Ma+ak2SHUt4h/vVX8bA5x9uIjb1hJXEksQ/nyZBVi/T+5bHpcibBN04WI2PdNGp4xZEhuNDp3Hj</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3aN/7PxwrNmja2J0eINLzr73ETSxHLcWDFF0h0WA8UtR+4HejdzRXNHxQJRFIrgXjM3nJsSQwzLAsfCV0Fwql3v4mF61HZWcn430kkGbnVw0HO/dsX1+/lxOrGl5JoMVa0S7Dce6Jlv2faBZvqbD74FCyWxKV+1In+olDtKshkdBezzazu1Q68hIG5b6FWJxRp4VNsQhX9S9Yj0JtA6/KZcp/U8sOf+hUjdb7ivJNb+DkO0xzv91ZYWMiyBz4S5g/uVPk7/HAzNrV33TxI8IOAcwlJCtA3tF8BgFHRuepgZ5V8imMdtSZ9SlOK/GrHXa3tbveHrL58lZ/s0nN8jsRx463I5UCdWZiKkMjYCbLU9+XfTGFW3f2Pq2P16k4e+yIowI6nvrVi5P1G3eGQhtV6Y4pXsNx0Tfu1tJk2qcHychb+jqlk3MURsMl1rcKAYjDRu8d8XQN0EWU3hTFRAYEWM3Xnf4+vM78Siw6c4Ng3vA8Ig9C5fyj819M9iRNTkneUCMugRjLPl4ZF2QhYGmPZp8stg+mo9OV5+9NjehnYbvjp459uqBh6eC+Cb+2/rc16</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9HgayuYbj8YcwZjqrfsqeBUDwUKA3+XT6vUx07QcPLLa4psZN8/eIrMt9MDpbCgIPQhO0jnJaxa449ScRD8g8dt3e2pF9lsL5lOg7RU7702yrIIC5c1Yry69duBYT5hrJ7DDNMD50siFBVp43B3pmPYL1en/Jgwp5jpwu8tLjFsvOJfLqjwAiS8WG+nc5qwe87roXl26wjHAZH2rqektTuT0TO7d1SNFHJ5Yq9uJL5Kz3CKIS+cNAwTnUx+UHLTj0DJJo=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLWj9wUNH46YIUzp8OfYWKD9w0Y3Lxe6w+elTVe3BqQxKkwC4bGANYb1lOPhg4uttGbDkrXw5YQWbQaVxLXpaezd6xw0pkHb0XvSLiVZN/NenyVJ/C47yNk9H8tLt7t+pk/kRZokhYQTEzD9bSBSkTrMbrR05uxGsphbEFuDDahQeXE/HAxhBE3CmWD/h+cvLjDUG8bxxJ6Whoq9v2VOHxG2ue8qyq08DTBqTwQQ5GIoVpr5M+8Jr1xLbj9pGipfgq</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV9PSaVZiNdNvJQDfBvj3aiyOp/qFo7C011mclhlsKvP6</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJteebagHI5shVOqOt6BHJrN5AU3tintXDiHCKDHvhhVibSgSzOWT9MhC0X/GCGXoRSWk12W/QbX4VwghxJj7n/yBuxe4nWJIBYSp8UXRtuKj94dXlCVlMP7ZD7gXCijlb5VhgLcvG76mSerzgTpswMQK6f9ZIopv54s+Wi0H9Du7wp3ZR+LORILh+2plBB5bOv/F44ej64Z+q+wfzLRzeONf7oyQ5wj+GWyuoE5qhWwKsYb4xHxZjbAcnaEQVkMxPdNN41ZTDGV09l0hqu9cYZDHlBB4FAS3dUDZVh8yL8BZv</Encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>