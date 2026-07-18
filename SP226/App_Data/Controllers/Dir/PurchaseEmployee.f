<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmnvmh" code="ma_nvmh" order="ma_nvmh" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin nhân viên" e="Employee"></title>
  <fields>
    <field name="ma_nvmh" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_nvmh" allowNulls="false">
      <header v="Tên nhân viên" e="Employee Name"></header>
    </field>
    <field name="ten_nvmh2">
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
      <item value="110-: [ma_nvmh].Label, [ma_nvmh]"/>
      <item value="1100: [ten_nvmh].Label, [ten_nvmh]"/>
      <item value="1100: [ten_nvmh2].Label, [ten_nvmh2]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDHwyWdnnAsOePGxNOFkX1ewBeXKsuiNTE6ZltW2RvZjHeU/+eanIX4W5EzGh9tL7drsije79EmZfbZi+XOUwGoD3pVYc2qZPaY17dPGDssq</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFLTtxwxLS0qUVnguBBCPvP+moSgqgi33QQeb2EgImnW/hcNQHPLxORv9sVEV3orHva5JGLYHrQGLL1tFaQUD+7YLjY2yr9xkH8MXs2hY8a9</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2IFUTeYgCI+m73yMqsqvhVfK/NCPDhMSW1bAIXdU+QckZVgeFDw1lvwzbW4aQLPjIwaS6ACvBtbFKkH8K44onDq//wP9L6RECYZlDoAlCwfOUGHFll+gIMQ8mqjrVnfW46rZtv0EoXbPuAEH5a570gvqaynTbHyhUfIR1VotKF46SIPij36DMUIPV0k483BqDWfKP33zlnuY/EwEvcXjxyqIjel5I5zEyDj5STzFz8ae1izzWaRSQSifzFiLCtg6Hu62qCBf440calR5m93lxgi4KuNGsYthgGeGYIYqABkG33tS6BylYam7Kpl1jAL8LaSlITCRheL59LQy+addwV6ynEXFInjNSycRziFm5M1+lHJO8UAfcj+QUW/g2NkE8w7gjYVRXWEZ9zoaMYvSILznelu/yFG2OZuVzNwfZRL4WyF0n7nrgrRCw9kRN7iyhUYtIn1Y1D/0Bdeo/ub/mD</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9HgayuYbj8YcwZjqrfsqeBUDwUP0lVUoJMLA0Maf2/0dPaw/WbDGL4JX20u3xqpqgIYP3hJxYcGi+2pP63YaUsbIb1JWXgo9NIO+EksFtm2fKpwGfHEt6Qx3R1Jz5ZmUhTl+K+rYg8YuLJySM7zJChcsBDvHxxoShnajs6FfRsKxnZ+bYeLH4cDy3vMnC9rE8LMLg42oiZ9AwRKEJcEvQOd+47k0N3z2u+GV2khN6kS08CXGRV4QS/qDwy3iCTZefzzYU=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLwjBBgbZmQhyvGZiofuSFd7YSHIm6GYULFSMnJ/lwZ9CetRd7imx41gtW38XotwUwuoiOdkjPc74HekmYVOfx3ZDEmSAUw0KztYCA26Mc6dNMB9rZKpi+J9cG5/YGh4mNZiKg5QKn6LryMhfYXtJnzMD/VmXLlaPI4wvoJgW/y9AyJQh4VZUjNskv2hvd0RPHRKD7Mvxvx87ifpINhBEqtdPV7WVOpahoNNiNLMLNzJJltHsnCzIzG3TVhxFpoVlm5CxxVXCahvITGM13VobEhw==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV8Vq3TRaifhXZEphiAmBgemnhptpHrw5Tu5dNBCewBj4</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22VbYGAhwaJV2zV4US7c/nl2SL0tTUTigz0UW39dOCVWMd0gbCRyfwRftLjAn9RQAQLz1EzEn26o0EKu52dcuxFS5WLUwQL0mZU3H+rUeVZlm4gmXyTAc18ql07uyzgyBliafSJCKdaZCMhfZHikJuWZLDdAQ8sdVyf5lWDXbC2dJGjTZn/7HK17u4cYB3FPpBytGGzmjjWcFZVGHD7JRKzoCfz2+VGglieU9L/55LQWLzHvLo3Nb9Glm5Q8YbmqvGpw71ii3fEuKJiLQB80BcI+PpQRV6x5O4IUNqafhIlwe0FwozGoPZJuNu10wRDBNdtoVSOtyy4qAjKC0jtO5HOLrwP+jT0cmQYy7KpA2xzTt</Encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>