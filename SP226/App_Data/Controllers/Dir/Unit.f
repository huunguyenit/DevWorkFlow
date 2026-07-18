<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY % Unit SYSTEM "..\Include\Unit.ent">
  %Unit;
  <!ENTITY % CompactMode SYSTEM "..\Include\CompactMode.ent">
  %CompactMode;
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmdvcs" code="ma_dvcs" order="ma_dvcs" xmlns="urn:schemas-fast-com:data-dir">
  <title v="đơn vị" e="Unit"></title>
  <fields>
    <field name="ma_dvcs" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã đơn vị" e="Unit Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_dvcs" allowNulls="false">
      <header v="Tên đơn vị" e="Description"></header>
    </field>
    <field name="ten_dvcs2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230"/>
      <item value="110: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [ten_dvcs].Label, [ten_dvcs]"/>
      <item value="11000: [ten_dvcs2].Label, [ten_dvcs2]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    &UnitListFormShowing;
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwcnV0XSxxE0sfQDiMDUHfz9KzUJHhCEsgiyQ72fyO0EDwAPZE8rMoZphh8VNG1a1lM=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfx0TKzd6yL2BlhLuCXsLiYIxfqK/KLBzCWqPyvsyWsHAogDjT7basqtGHLVDTHaz/jTUWt/bT0Cv72SJZ53KyAA=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8DXeeCi+ES4uYv5Q4DQ/vZaWddXCI7PWaotKgYu9/5x3oPW/cdNvYTpnxJYnWRCkGs3LipiwHlWCFLCQa1S26QcouxuwCNSv9LJumkQ/bCl7dza242uG3DPxQAPQiTBgeqMSUIbims3ln+hB+N/xF5TXXfktoGojvQ9KaAxBY0g2LJxUwTPbiY/VR+lFNQpusFKToCREDXgf1KDq+wA6i9GDmqZJGux7U5OtYlc6aIVa40mn0Lhiunu41CHNnAVb24nfPGKFOpylhbOSQHDAf71vDdcKapD9uUNLwyMtD7sasANsppn41LaUnPlkKMDgK4lQ3AmAJfci+yd1vbEzoJqdpb/3GLhSHRUpkrcBkqkrVsG9gug5R8RoKxUUbPp71WMv+3zbfg8cFYIn4aO4P5iAjfKHDyIU5zXNiXJB50Xjo0/eVIux6uWAURTX/Dxr3GFWhqthEVVtAEU+KFKcQ/VWAQH6T/+TDvUreN7P/VlSALIq5edyfs9m7fmsT19vFeS21fzfffSsxSOX1q8WIDqA==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nABnDxz3jMkTJO3yVtF21H/G8pkT8ZFIy3yRCfzMj3vBc/mjJMjIavBUwNpGuwJlBeBH8sobsB+h6aQKo73WHvHJzZXFPkT+Ojfl+COr+0wC7rebxP0EDug8TEo/gD8iphDIXM4Eq8vdiagdy2QNbSyqjuZW4v9xDSr/9tbWykkCf5SIP9249ylr/dOPkeiy0xivf4sgBCUP/w2+z71HlD89fv2q6yyefzzTwHd2UQ/8=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        &Control.Unit.Inserted;
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jPX+9//UVyVOvGC9jzOM6o9ysxlTis28u6K0fEbpFfcCY7ycw3UFn3IC35SyURkXS6qMpXHwHno64mMzO2DyPzJXdgZOnuWnftA4mPvirwsFbPtlcxMb1zkB6FlZ3Z2QTjyRLJAJPNNkOj236DHPOrfUFtUaCDTH7NIjD7LUmXjy2l6PMgTgpT0Us0Ahhlk2wA+pqAhD1U5kKjMPvNuHFHdiNqeCFliRem/e4Dy+CwWn7Gh09mEmEpO//M9p74GhBKjJ0Gvwpmh59Q0OW8XVWeP2kKwJkW3KF5mQcwHPt8+qYpr+K2fLuOmju91k4hdM0gzPHLmcWCmsseQ6LVmShFh3HUVxjNo9I436b7nZbjF/gR3lChISsCdtJfMicMJ967xMKi015ckd8Ptdi1m4nmw==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeuQkjfwNNbUg9TmXvW/awhgSSH4yt4a4mTJ7prLX2Lm2</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHaMIJOIdLApwJ5aUDBaYRCa8TKB7auek8Z09swsfSYjgbIIaOKnK1kG6zAUXWyTvgsVHum0yEmUQevk8pA7mJ+6oUNG7E5l1WKjLsQdAjHWF9eoUwJeJT2vq7e/kXfJE/RPxjo8WcbFjah2mGxbW7ea0pmn2IH0DyY+aM/d7giiucSn8jJ+3fSeCpgBqEv799rKF4bFTK6eha7iyVW+cKYWxeqdUC8nWHNDAbUu5I6K45xzskE1jk6l5JjgJEsyxFw=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkabRM2cZF2gGE/GbTLaQPj+4/blkMC6aRg/H1Nz2uGl4M3uqToBFI7IqwHPZWgIoTSI62RNDI3euCzxDBNhYVHU2/RZmdImwVYPV/xAv8/y3wYtKzZqT45k7tEGu331UAlDLLWcQXwlxQLZkRpmZs9UXYcx0YeG8hAvsOn1x6YXcEPW3tApL5vk+TfrUeK0AV+wPX7z+wZJYnQ3oWpMH56buf7pV5IeR/417HJVWH9PKwgF4YCcgfbhrM0Xs2KsoKObM3Uj3ireIzOMQHjRAJi8rfFkMDC6yXJFKT2CTmIL6BwJf5aPfIrrffRNg5oBsYJ5PVimrSj7bo22uQZ0Hkx7SXHVbAaWdSKi7IObjKayBkN7TClzCLFCG0D9AVnlctu8P4FHpwQYy1/lK0osUP/b/vQErkgnfrZaTpJBFIr0o+TH1Wi2oG39jSBO5Z5De51GWO41i0Nec5IKh3SEMSO1uU5V1RXq7xJfkd4C1iJR2KBbsejR+W1cvKv0IW0H3yv+7CB5Sd9Zh+fhOAaL9ChmY9d8uqJiIg6DKPMd0gqbr0neXBvBxADXw8+flleKepoRlVlwcEqj+yHpk50besuT5X1uU/kkA6EikJbIsnadfCpkVYyCuU29xJzvx1LY8zHh3CWpXX+tgk9lgy2uQgJpGB6GNO5DyY08wjd2q6IfIO1ks7Z6hjOW3XZND3G9I0Q0o9AHbYN+DDLNnDa64q/0f8HSaBwmshw9j4a32aIfy9q6Vl0Qzq6cTKsFSSyQkJP1zMJQyp3wS7dup213NNRx07Pw6PdO53YnZQjqvV7RI9cpU5wOpNhJaE3bSxtinLE=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>