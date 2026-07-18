<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY TransferID "ManagementObject3">

  <!ENTITY % ManagementObjectName SYSTEM "..\Include\ManagementObjectName.ent">
  %ManagementObjectName;

  <!ENTITY % Nested SYSTEM "..\Include\Nested.ent">
  %Nested;
]>

<dir table="dmdtqt3" code="ma_dtqt" order="ma_dtqt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="&Name.Title3.v;" e="&Name.Title3.e;"></title>
  <fields>
    <field name="ma_dtqt" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã đối tượng" e="Object Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_dtqt" allowNulls="false">
      <header v="Tên đối tượng" e="Description"></header>
    </field>
    <field name="ten_dtqt2">
      <header v="Tên khác" e="Other Name"></header>
    </field>

    <field name="dtqt_sd_pslk" dataFormatString="0, 1" clientDefault="0" align="right" >
      <header v="Theo dõi số dư" e="Balance Tracking"></header>
      <footer v="1 - Có, 0 - Không " e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="nh_dtqt1">
      <header v="Nhóm 1" e="Group 1"></header>
      <items style="AutoComplete" controller="ManagementObjectGroup3" reference="ten_nh1%l"  key="status = '1' and loai_nh = 1" check="loai_nh = 1" information="ma_nh$dmnhdtqt3.ten_nh%l"/>
    </field>
    <field name="ten_nh1%l" defaultValue="''" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="nh_dtqt2">
      <header v="Nhóm 2" e="Group 2"></header>
      <items style="AutoComplete" controller="ManagementObjectGroup3" reference="ten_nh2%l"  key="status = '1' and loai_nh = 2" check="loai_nh = 2" information="ma_nh$dmnhdtqt3.ten_nh%l"/>
    </field>
    <field name="ten_nh2%l" defaultValue="''" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="nh_dtqt3">
      <header v="Nhóm 3" e="Group 3"></header>
      <items style="AutoComplete" controller="ManagementObjectGroup3" reference="ten_nh3%l"  key="status = '1' and loai_nh = 3" check="loai_nh = 3" information="ma_nh$dmnhdtqt3.ten_nh%l"/>
    </field>
    <field name="ten_nh3%l" defaultValue="''" readOnly="true" external="true">
      <header v="" e=""/>
    </field>

    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Note"/>
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
      <item value="110: [ma_dtqt].Label, [ma_dtqt]"/>
      <item value="11000: [ten_dtqt].Label, [ten_dtqt]"/>
      <item value="11000: [ten_dtqt2].Label, [ten_dtqt2]"/>
      <item value="11100: [dtqt_sd_pslk].Label, [dtqt_sd_pslk], [dtqt_sd_pslk].Description"/>
      <item value="11010: [nh_dtqt1].Label, [nh_dtqt1], [ten_nh1%l]"/>
      <item value="11010: [nh_dtqt2].Label, [nh_dtqt2], [ten_nh2%l]"/>
      <item value="11010: [nh_dtqt3].Label, [nh_dtqt3], [ten_nh3%l]"/>
      <item value="11000: [ghi_chu].Label, [ghi_chu]"/>

      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPS6o0FO4oa0V8ggf7RVJkjpvu5lLetaENfYXcCme6Jq</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14Ufxdqmn275oJpJ4vjI6yXBNmt53HOUPRQXzfP97G9ooeGa4nGskGaQ4Gsq9owho27NGQw==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCLjOzEBOw7WLxwsZmNVIhdyKUhv/DDvGaGbpwHJkbqg</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14Ufxdqmn275oJpJ4vjI6yXBNmt53HOUPRQXzfP97G9ooeGa4nGskGaQ4Gsq9owho27NGQw==</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNIJlE64bPBM7jRB/7lMaz36rtAzucKt1O7R/nmmdre+PEW2qajspca/k5rfCJ6TX9YtWcHr2ITGDZZwxmCZaa6UzXczuEpAXUQ0c+99Rh4w4g=</Encrypted>]]>&ManagementObject3.Nested.Message.v;<![CDATA[<Encrypted>&q0x/DRPtnEN53dA6mwugdrZRshCW1bVNeWEEHh/oc3J72PVkFTt1Cj9w94Ohlwl2</Encrypted>]]>&Name.Field3.Text.v;<![CDATA[<Encrypted>&Gf3AUkJFg+tajSC6Sx7Gz1BnKUTogbpThGKy6QKRj4/nAEFHD5snGVsijmDfNPki712bfheDWjp9RAJpvl3LfCfYrI9TgztIxxKRHIB8dTg=</Encrypted>]]>&ManagementObject3.Nested.Message.e;<![CDATA[<Encrypted>&Gf3AUkJFg+tajSC6Sx7GzxnpT4AYOF9vKHJv0Jj/9vcJaJ5htXwtjE3zxLjriM3vbzrjMPZJBZ+f/p8fuCgs2n7r7SDEn2BL5eAcYGQr+dDnPpWyxiL3rPz32hkQARbAS2SqnJhvOMstYRJ3uuR4VjtMJSBtn+P+kx8wbyyw7HqaK4fqlFeWZ3HO+9jvgXAOJsVjajwZvI7Xh8spqvGyp6ExklMjs9MiNN6VfJSZCoO3aX6Jde2dqOHQ6k2D3fQDr1j5eSzWod6trHjl1v2k/iM+S5asJInUSzL29rJgtWHCwxtC9ytP3g24C9V/LcgKJudkM6sUQnwZRMF53zfjxw==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9HgayuYbj8YcwZjqrfsqeBUDwU7vMRJi5phIo/q55KJkMZKQ==</Encrypted>]]>&ManagementObject3.Nested.Key.a;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLZMHckGCQw6x8e76tZNpJUNG1MpkRykmn/d/guGIYTZAYSYR1pU5affmYGTOewcjNnpIo2staaoyRIlpGW+2xb81goousBhkLDgH4NTQvxJvycyyw92AiSZYRyrZoZzOeBRbRib+pCmTetdtIZNBTLfA2FbICqp+BZGDsv8DMrzApWglWLq4bTSyDdsb1jT2Vg==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLYC3D0BFL/3Myv2zloEL6f8jwhG5/ehjYB0gu1yK11mk2uDyrjd4i5P6zoyOFHA0NczUJ40t3B+dsZIdqIrgeBI5LkLlPD/NRbNedPHS5uvzhgZobD5h95Zz8A8tWGOt1sCKNe2xo9Hwx28dIoPE4k7eKanE2tEMYwe1tqnG4BBB5EVxMWpN7rJAKfU4hyFms</Encrypted>]]>&ManagementObject3.Nested.Key.a;<![CDATA[<Encrypted>&O0YyoFEd0hYz2N2q7aidVFYVPs3kcc0CUa2L1Eibn+r06+g0/MrWsAotfUSC2NGISYf0cteJLx4BJvzKMKyNxIp3JgWzC51PnLMmNtytoAK6z1WO7cQ8sm6vDdmAZGg0spwY/02UxIhUh33KEvXpsdNTgYBQ1Cii27kG9hJCyDH2qmCEGDM3ZyxHxOUmvM0n</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV5kCMOtLI7MplOV+/uhOv14/LHBdQZqiKr+Av4BP0ud5</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22SAyB0lrLIl8l+LB5Gl9ES8J7BXWwS26JYkGY8fKh3Vm</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14UfxdiFSTpUCeaNH7KwSjy3CGZXS+frIal1sTDiGHT/r5gjJMIOtEa+bymNUITZYACK1Jw==</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14UfxdrQpE+ldSVHwLzSMuWNAAKq9R475g+agJjGdwl5ftMfKm+WtcKqYdRBypKDFFw6ZekjcSAS15sc0o1p6ZvIJIdM=</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14Ufxdv3myuCMPgmcOEmCJ5KLmiNjGCGkWKblg1ziOcchvNfUNk7kmPTtrviu/w6KjIfMvp7oxbIfhB1N+ZKVxN3nFh8=</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14UfxdrQpE+ldSVHwLzSMuWNAAKo3v+E4hRortekDPKQydNNmacPmwvJCnR8qzCP8n0YbOqsK4PRHYW39Ako6pJ9jo04=</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&ToRrqlerzz7qVOp14UfxdrQpE+ldSVHwLzSMuWNAAKoYlLk8sujKrFS0zvehuCqqPa7XVEGM9OswUgoRlF5RmnrXZRqC/o9XGg1c6GO23Fs9XFfUbrNWAXEt93/e0xYdmwQyuT//1h3yQwzjt8Vgu+KpvUHckmcIIDrBO6qB69j6WhXaLiShLg0vBBQG6TXcUhgYLKMew5fCD6QhDpNFLm249uN47GJjyZjC5TfGzacU8AlRJG7octknQvSNAPs7uk6ubkimYUBb1B++WquesA==</Encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>