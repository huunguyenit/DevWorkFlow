<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="sfdmnlydo" code="ma_nh" order="ma_nh" xmlns="urn:schemas-fast-com:data-dir">
  <title v="nhóm lý do" e="Reason Group"></title>
  <fields>
    <field name="ma_nh" isPrimaryKey="true" allowNulls="false" dataFormatString="@upperCaseFormat">
      <header v="Mã nhóm" e="Group Code"></header>
      <items style="Mask"></items>
    </field>
    <field name="ten_nh" allowNulls="false">
      <header v="Tên nhóm" e="Description"></header>
    </field>
    <field name="ten_nh2">
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
      <item value="120, 30, 70, 330"/>
      <item value="110-: [ma_nh].Label, [ma_nh]"/>
      <item value="1100: [ten_nh].Label, [ten_nh]"/>
      <item value="1100: [ten_nh2].Label, [ten_nh2]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNsjcNw4zRKATSYfY2PZdBabk+zSk+CpDee9xj/pDyp+4pOZlhrjUqT2daiYkeRePlQGHfcvAQ3vsdCHKNafvbIHWmiQBHYb9iQHoOMD6j8j</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAlToWsMdfAZsGJs2F7HR8tl17JgVZqq207lS9xTFKV3dtG2XfmVhxJ1virqfhVXiN2wfRr1niW02pnXL3Fw05KQT8kdQ77FeNO1C31YMKKc</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNI0P19JDD2G8GQW1VvSxieyA8t0sxmZY8xAiRRpwYfP4pnrPgpeW7brVpqaOTSnbEhkXFmhV/7Xq2qOBgcZuzqkYPJd35f7LjRe1u4+6OdBthXDA7J7qQN/fzPLjbyvd297X4MbLgwRnyLEiY4A+UPFJ2o8yqkBawddfdIDPBNGRLz1EwczGFtpUVHF9OZSLtSxCG9JHEiM9TWAf5uB5ujPU3OFz+4plHGlEr+OGCHhFGQS/5AF9i0uJFJv126pnO/tZb7JDi5TQ13Aj5VFT8xxi1p0dA74qU0Ls4qOpfhsafiipnRrlg4rX1UKGkslPakIypBXSpM9Ed2zVBBZNahQnfwfTu8dd5HDHVaTO/rjbQ=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7Ck7qQv2W2RdgC8k5GCkFyvtOk+ilA7gwU5/Tu8VXJ8T8TE3XxA3d+7R2w4dkQB5lM1vUCqmEjm6E7sLhKZYmLkkxwuZVNdOIsoLpIDGJjr+b4QszYDEFFOzmacn4/h9hiKF7CYjlWXUPRg7LX4fiySspQmt8wJ2W2bwc/HQCh7dgNIK77/FKE/ghuCPVasu4BeUmePgowXdp5KWOkqkfrYjxiQzOEv2BZ3bJrhcNFORI=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLulFcBFU2bKHSoYUUPaBtmMpbY1A1KULnCr8WwKtqvHsUWaGUP5owbanUvcOih+hmXNMXT69SG8FP7bGOXehAluNqvBG7LDuaxC0bs922kOuLClWEKeqbctUtOTPgwrX2eZwQBw6b2Rj6qsu5llzGG4tU622jy8T1oEeKTjFfHMMH0TPu83fbLQNZpg/KeWB07/ZywEsQURDw4YE4cI8AmJdXqITIdOzH12ObK2qW1r7UuQza/budZBzy3CXJcDL7</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XVxdSZNdUlyH89eCz0UUw1qcFGsY4enB2aG0Ejt5DW2p0</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQgaudoRIQ6p1GKbZA/Q6mDmDBsvFR068QbsqaPqxheSHTS+K1ZUaZTzjvXPpR8sIsp6iqZMVaEYk37M71gLOqvtlMfypljn8ondl50kjV7M2zRE5IJHJmCI/stWP7a4l+K8dvchyqr/VdjE3yvqEjtgHtZ38Znpohvx8wIh9LPXuqWranNZo/WzMcSA95A/vHWCg/cQTWLtzlbWvFfGeuatfo1YgIELJScKrouByM72RjxFo55VcuppTQJReHaezPZafXjVdseCzOGDsB4RZ5FssYlwOmUiBw1yjjku/i+c</Encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>